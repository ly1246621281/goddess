package goddess.controller;

import goddess.entity.User;
import goddess.service.UserService;
import goddess.utility.AccessToken;
import goddess.utility.Config;
import goddess.utility.HttpClient;
import goddess.utility.RandomString;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WeixinServerController {
	@Autowired
	@Qualifier("userService")
	private UserService userService;
	
	@RequestMapping(value="/weixin",method={RequestMethod.GET})
	public @ResponseBody void checkSignature(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException
	{
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		String echostr = request.getParameter("echostr");
		String token = Config.getString("token");
		List<String> arr = new ArrayList<String>();
		arr.add(nonce);
		arr.add(timestamp);
		arr.add(token);
		Collections.sort(arr);
		String tempString = "";
		for(int i = 0;i<arr.size();i++)
			tempString += arr.get(i);
		tempString = 	new String(DigestUtils.sha1Hex(tempString));
		if(signature.equals(tempString))
		{
			response.getOutputStream().write(echostr.getBytes());
		}
	}
	
	@RequestMapping(value="/xdhw",method={RequestMethod.GET})
	public String  getUserInfo()
	{
		String url =Config.getString("oauth2url");
		String param =  "appid="+Config.getString("appid")+"&redirect_uri=" + URLEncoder.encode(Config.getString("url")+"/goddess/dogetuserinfo")+"&response_type=code&scope=snsapi_userinfo&state=STATE#wechat_redirect";
		return "redirect:"+url+"?"+param;
	}
	
	@RequestMapping(value="/dogetuserinfo",method={RequestMethod.GET})
	public String doGetUserInfo(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException
	{
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String access_token_url = Config.getString("accesstokenurl");
		String access_token_param = "appid="+Config.getString("appid")+"&secret="+Config.getString("appsecret")+"&code="+code+"&grant_type=authorization_code";
		String access_token_string = HttpClient.sendGet(access_token_url, access_token_param);
		JSONObject access_token_json = new JSONObject(access_token_string);
		String access_token = "";
		String openid = "";
		try
		{
			access_token = access_token_json.getString("access_token");
			openid = access_token_json.getString("openid");
		}
		catch(Exception ex)
		{
			 return "redirect:xdhw";
		}
/*		String user_info_url = "https://api.weixin.qq.com/sns/userinfo";
		String user_info_param = "access_token="+access_token+"&openid="+openid+"&lang=zh_CN";
		String user_info_string = HttpClient.sendGet(user_info_url, user_info_param);*/
		String user_info_url = Config.getString("userinfourl");
		String user_info_param = "access_token="+AccessToken.getAccessToken()+"&openid="+openid+"&lang=zh_CN";
		String user_info_string = HttpClient.sendGet(user_info_url, user_info_param);
		System.out.println(user_info_string);
		JSONObject user_info_json = new JSONObject(user_info_string);
		if(user_info_json.getString("subscribe").equals("0"))
		{
			
		}
		else
		{
			User user = new User();
			user.setCity(user_info_json.getString("city"));
			user.setCountry(user_info_json.getString("country"));
			user.setHasrepost(0);
			user.setHasvote(0);
			user.setHeadimgurl(user_info_json.getString("headimgurl"));
			user.setNickname(user_info_json.getString("nickname"));
			user.setOpenid(user_info_json.getString("openid"));
			user.setProvince(user_info_json.getString("province"));
			user.setSex(user_info_json.getString("sex"));
			userService.save(user);
			HttpSession session = request.getSession(true);
			session.setAttribute("openid", openid);
		}
		return "redirect:voteindex";
	}
	
	@RequestMapping(value="/voteindex",method={RequestMethod.GET})
	public ModelAndView voteIndex(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException
	{
		return new ModelAndView("vote_index");
	}
	
	@RequestMapping(value="/join",method={RequestMethod.GET})
	public ModelAndView join(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException
	{
		return new ModelAndView("vote_join");
	}
	
	@RequestMapping(value="/getjsinfo",method={RequestMethod.GET})
	public @ResponseBody void getJsInfo(HttpServletRequest request,HttpServletResponse response) throws IOException, JSONException
	{
		String url = request.getParameter("url");
		String timestamp = Long.toString(new Date().getTime()/1000);
		String noncestr = RandomString.getRandomString(16);
		String ticket = AccessToken.getJsTicket();
		String signature = "jsapi_ticket=" + ticket + "&noncestr="+noncestr+"&timestamp="+timestamp+"&url="+url;
		System.out.println(signature);
		signature = new String(DigestUtils.sha1Hex(signature));
		JSONObject ret = new JSONObject();
		ret.put("appid", Config.getString("appid"));
		ret.put("timestamp", timestamp);
		ret.put("noncestr", noncestr);
		ret.put("signature", signature);
		ret.put("url", url);
		response.getOutputStream().write(ret.toString().getBytes());
	}

	@RequestMapping(value = "/about", method = { RequestMethod.GET })
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response) throws IOException, JSONException {
		return new ModelAndView("about");
	}

}
