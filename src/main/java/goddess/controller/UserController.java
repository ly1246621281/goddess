package goddess.controller;

import goddess.entity.Campaigner;
import goddess.entity.User;
import goddess.service.CampaignerService;
import goddess.service.UserService;
import goddess.utility.Config;

import java.io.IOException;

import javax.persistence.MappedSuperclass;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
/*
 *1.@Controller和 @RequestMapping注解代表MVC的c（控制层），配置注意格式，mapping后的value与method为对应表单请求
 *2.@Autowired代表自动装配字段、方法  缺省set.get方法同时spring配置那块的注入申明  http://blog.csdn.net/heyutao007/article/details/5981555
 *3.@Qualifier是用来  按照类型自动绑定，http://lwg2001s.iteye.com/blog/1674039
 *4.@RequestBody 将HTTP请求正文转换为适合的HttpMessageConverter对象。   http://snowolf.iteye.com/blog/1628861
 */

@Controller
public class UserController {
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@Autowired
	@Qualifier("campaignerService")
	private CampaignerService campaignerService;
	
	@RequestMapping(value = "/vote", method = { RequestMethod.POST })
	public @ResponseBody void vote(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException 
	{
		HttpSession session = request.getSession(true);
		String openid = (String) session.getAttribute("openid");
		JSONObject ret = new JSONObject();
		if (openid == null) {
			ret.put("status", "faile");
			ret.put("errorstring", "请先关注该公众号");
		} else {
			String selected = request.getParameter("selected");
			User user = userService.getUserByOpenId(openid);

			if (user.getHasvote() >= Integer.parseInt(Config.getString("maxvotenum"))) {
				ret.put("status", "faile");
				ret.put("errorstring", "投票达到上限");
			} else {
				try {
					userService.vote(user, selected);
					Campaigner camp = campaignerService.getCampByOpenId(selected);
					ret.put("status", "ok");
					ret.put("newnum",camp.getVotenum());
					ret.put("remainvotenum", Integer.parseInt(Config.getString("maxvotenum"))-user.getHasvote());
				} catch (Exception ex) {
					ex.printStackTrace();
					ret.put("status", "faile");
					ret.put("errorstring", "服务器出错");
				}
			}
		}
		response.getOutputStream().write(ret.toString().getBytes());
	}
	
	@RequestMapping(value="/repost",method={RequestMethod.GET})
	public @ResponseBody void repost(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException
	{
		System.out.println("repost");
		HttpSession session = request.getSession(true);
		String openid = (String) session.getAttribute("openid");
		JSONObject ret = new JSONObject();
		if(openid ==null)
		{
			ret.put("status", "faile");
			ret.put("errorstring", "请先关注该公众号");
		} else {
			User user = userService.getUserByOpenId(openid);
			try {
				userService.repost(user);
				ret.put("status", "ok");
			} catch (Exception ex) {
				ex.printStackTrace();
				ret.put("status", "faile");
				ret.put("errorstring", "服务器出错");
			}
		}
		response.getOutputStream().write(ret.toString().getBytes());
	}
	
	@RequestMapping(value="/getuser",method={RequestMethod.POST})
	public @ResponseBody void getuser(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException
	{
		String openid = request.getParameter("openid");
		JSONObject ret = new JSONObject();
		if(openid == null || openid.equals(""))
		{
			ret.put("status", "faile");
			ret.put("errorstring", "输入有误");
		}
		else
		{
			try
			{
				User user = userService.getUserByOpenId(openid);
				ret.put("openid", user.getOpenid());
				ret.put("nickname", user.getNickname());
				ret.put("sex", user.getSex());
				ret.put("province", user.getProvince());
				ret.put("city",user.getCity());
				ret.put("country", user.getCountry());
				ret.put("headimgurl", user.getHeadimgurl());
				ret.put("hasvote", user.getHasvote());
				ret.put("hasrepost", user.getHasrepost());
				ret.put("status", "ok");
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
				ret.put("status", "faile");
				ret.put("errorstring","服务器出富哦");
			}
		}
		response.getOutputStream().write(ret.toString().getBytes());
	}
	
	@RequestMapping(value="/show",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView show(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView mv=new ModelAndView("vote_user");
		return mv;
	}
	
	@RequestMapping(value="/settag",method={RequestMethod.POST,RequestMethod.POST})
	public @ResponseBody void setTag(HttpServletRequest request,HttpServletResponse response) throws JSONException, IOException
	{
		String tag = request.getParameter("tag");
		HttpSession session = request.getSession(true);
		session.setAttribute("tag", tag);
		JSONObject ret = new JSONObject();
		ret.put("status", "ok");
		response.getOutputStream().write(ret.toString().getBytes());
	}
	

	
}
