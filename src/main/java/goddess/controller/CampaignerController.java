package goddess.controller;

import goddess.entity.Campaigner;
import goddess.service.CampaignerService;
import goddess.utility.Config;
import goddess.utility.Media;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CampaignerController {
	@Autowired
	@Qualifier("campaignerService")
	private CampaignerService campaignerService;
	
	@RequestMapping(value="/getcampbytag",method={RequestMethod.POST})
	public @ResponseBody void getCampByTag(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException
	{
		HttpSession session = request.getSession();
		String tag = (String) session.getAttribute("tag");
		if(tag == null)
			tag = "";
		//String tag = request.getParameter("tag");
		List<Campaigner> list;
		JSONArray ret = new JSONArray();
		if(tag == null||tag.equals(""))
		{
			list = campaignerService.getAllCamp();
		}
		else
		{
			list = campaignerService.getCampByTag(tag);
		}
		for(Campaigner camp : list)
		{
			JSONObject one = new JSONObject();
			one.put("openid", camp.getOpenid());
			one.put("photourl_1", camp.getPhotourl_1());
			one.put("photourl_2", camp.getPhotourl_2());
			one.put("photourl_3", camp.getPhotourl_3());
			one.put("tag", camp.getTag());
			one.put("school", camp.getSchool());
			one.put("grade", camp.getGrade());
			one.put("name", camp.getName());
			one.put("tel", camp.getTel());
			one.put("votenum", camp.getVotenum());
			if(tag == "")
				tag = "全部标签";
			one.put("pagetag",tag);
			ret.put(one);
		}
		response.getOutputStream().write(ret.toString().getBytes());
	}
	
	@RequestMapping(value="/getcampbyopenid",method={RequestMethod.POST})
	public @ResponseBody void getCampByOpenId(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException
	{
		String openid = request.getParameter("openid");
		List<Campaigner> list;
		JSONObject ret = new JSONObject();
		if(openid == null||openid.equals(""))
		{
			ret.put("status","fail");
			ret.put("errorstring", "输入错误");
		}
		else
		{
			Campaigner camp = campaignerService.getCampByOpenId(openid);
			ret.put("status","ok");
			ret.put("errorstring","");
			ret.put("openid", camp.getOpenid());
			ret.put("photourl_1", camp.getPhotourl_1());
			ret.put("photourl_2", camp.getPhotourl_2());
			ret.put("photourl_3", camp.getPhotourl_3());
			ret.put("tag", camp.getTag());
			ret.put("school", camp.getSchool());
			ret.put("grade", camp.getGrade());
			ret.put("name", camp.getName());
			ret.put("tel", camp.getTel());
			ret.put("votenum", camp.getVotenum());
		}
		response.getOutputStream().write(ret.toString().getBytes());
	}
	
	@RequestMapping(value="/getphoto/{picaddr}",method={RequestMethod.GET})
	public @ResponseBody void getPhoto(@PathVariable String picaddr,HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException
	{
		String path = Config.getString("photodir");
		String fileName = path + picaddr;
		File photoFile = new File(fileName);
		FileInputStream photoInputStream = new FileInputStream(photoFile);
		byte[] data = new byte[(int)photoFile.length()];
        int length = photoInputStream.read(data);
		response.getOutputStream().write(data);
	}
	
	
	@RequestMapping(value="/dojoin",method={RequestMethod.POST})
	public @ResponseBody void doJoin(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException
	{
		JSONObject ret = new JSONObject();
		HttpSession session = request.getSession(true);
		String openid = (String) session.getAttribute("openid");
		if(openid == null)
		{
			ret.put("status","fail");
			ret.put("errorstring","请先关注该公众号");
		} else {
			String name = request.getParameter("name");
			String school = request.getParameter("school");
			String grade = request.getParameter("grade");
			String tel = request.getParameter("tel");
			String styleType = request.getParameter("styleType");
			String photo_1 = request.getParameter("photo_1");
			String photo_2 = request.getParameter("photo_2");
			String photo_3 = request.getParameter("photo_3");
			/*
			 * System.out.println(name); System.out.println(school);
			 * System.out.println(grade); System.out.println(tel);
			 * System.out.println(styleType); System.out.println(photo_1);
			 * System.out.println(photo_2); System.out.println(photo_3);
			 */
			File dir = new File(Config.getString("photodir"));
			if (dir.exists() == false)
				dir.mkdir();
			String path = dir.getAbsolutePath();
			File file1 = new File(path + "/" + openid + "_1");
			File file2 = new File(path + "/" + openid + "_2");
			File file3 = new File(path + "/" + openid + "_3");
			FileOutputStream out = new FileOutputStream(file1);
			out.write(Media.getMedia(photo_1));
			out.close();
			out = new FileOutputStream(file2);
			out.write(Media.getMedia(photo_2));
			out.close();
			out = new FileOutputStream(file3);
			out.write(Media.getMedia(photo_3));
			out.close();
/*			 Thumbnails.of(file1.getAbsolutePath())   
		     .size(500, 700)  
		     .toFile(path + "/" + openid +"_0"); */
			Campaigner camp = new Campaigner();
			camp.setGrade(grade);
			camp.setName(name);
			camp.setOpenid(openid);
			camp.setPhotourl_1(file1.getName());
			camp.setPhotourl_2(file2.getName());
			camp.setPhotourl_3(file3.getName());
			camp.setSchool(school);
			camp.setTag(styleType);
			camp.setTel(tel);
			camp.setVotenum(0);
			if (campaignerService.getCampByOpenId(openid) == null) {
				ret.put("status", "ok");
				ret.put("errorstring", "");
			} else {
				ret.put("status", "rewrite");
				ret.put("errorstring", "");
			}
			campaignerService.save(camp);
		}
		response.getOutputStream().write(ret.toString().getBytes());
	}
}
