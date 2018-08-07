package goddess.utility;

import org.json.JSONException;

public class Media {
	public static byte[] getMedia(String mediaId) throws JSONException
	{
		byte[] ret = HttpClient.sendGetByte(Config.getString("mediaurl"), "access_token="+AccessToken.getAccessToken()+"&media_id="+mediaId);
		return ret;
	}

}
