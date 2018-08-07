package goddess.utility;

import java.util.Date;

import org.json.JSONException;
import org.json.JSONObject;

public class AccessToken {
	private static String token = "";
	private static String ticket = "";
	private static long lastRefreshTokenTime = new Date().getTime();
	private static long lastRefreshTicketTime = new Date().getTime();
	private static int tokenExpires_in = 0;
	private static int ticketExpires_in = 0;
	//4.
	private static void readToken() throws JSONException
	{
		String tokenUrl = Config.getString("tokenurl");
		String tokenParam = "grant_type=client_credential&appid="+Config.getString("appid")+"&secret="+Config.getString("appsecret");
		String resultString = HttpClient.sendGet(tokenUrl, tokenParam);
		JSONObject resultJson = new JSONObject(resultString);
		token = resultJson.getString("access_token");
		tokenExpires_in = resultJson.getInt("expires_in");
		System.out.println("token = " + token + " , expires_in = "+tokenExpires_in);
	}
	//2.
	private static void readTicket() throws JSONException
	{
		String ticketUrl = Config.getString("ticketurl");
		String ticketParam = "access_token="+getAccessToken()+"&type=jsapi";
		String resultString = HttpClient.sendGet(ticketUrl, ticketParam);
		JSONObject resultJson = new JSONObject(resultString);
		ticket = resultJson.getString("ticket");
		ticketExpires_in = resultJson.getInt("expires_in");
		//System.out.println("token = " + token + " , expires_in = "+expires_in);
	}
	
	private AccessToken()
	{
		
	}
	//3.
	public static String getAccessToken() throws JSONException
	{
		Long thisTime = new Date().getTime();
		System.out.println("lastAccessTokenTime" + (thisTime - lastRefreshTokenTime )/1000);
		if(token.equals("") ||(thisTime - lastRefreshTokenTime )/1000 >= tokenExpires_in)
		{
			readToken();
			lastRefreshTokenTime = thisTime;
		}
		return token;
	}
	//1.
	public static String getJsTicket() throws JSONException
	{
		Long thisTime = new Date().getTime();
		System.out.println("lastAccessTicketTime" + (thisTime - lastRefreshTicketTime )/1000);
		if(token.equals("") ||(thisTime - lastRefreshTicketTime )/1000 >= ticketExpires_in)
		{
			readTicket();
			lastRefreshTicketTime = thisTime;
		}
		return ticket;
	}
	
}
