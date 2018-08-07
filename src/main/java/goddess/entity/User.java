package goddess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "user")
@Entity
public class User {
	@Id
	@Column(name = "openid")
	private String openid;
	
	@Column(name = "nickname")
	private String nickname;
	
	@Column(name = "sex")
	private String sex;
	
	@Column(name = "province")
	private String province;
	
	@Column(name = "city")
	private String city;
	
	@Column(name = "country")
	private String country;
	
	@Column(name = "headimgurl")
	private String headimgurl;
	
	@Column(name = "hasvote")
	private Integer hasvote;
	
	@Column(name = "hasrepost")
	private Integer hasrepost;

	public Integer getHasrepost() {
		return hasrepost;
	}

	public void setHasrepost(Integer hasrepost) {
		this.hasrepost = hasrepost;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getHeadimgurl() {
		return headimgurl;
	}

	public void setHeadimgurl(String headimgurl) {
		this.headimgurl = headimgurl;
	}

	public Integer getHasvote() {
		return hasvote;
	}

	public void setHasvote(Integer hasvote) {
		this.hasvote = hasvote;
	}
	
	
}
