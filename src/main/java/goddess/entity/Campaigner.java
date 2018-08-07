package goddess.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "campaigner")
@Entity
public class Campaigner {
	@Id	
	@Column(name = "openid")
	private String openid;
	
	@Column(name = "photourl_1")
	private String photourl_1;
	
	@Column(name = "photourl_2")
	private String photourl_2;
	
	@Column(name = "photourl_3")
	private String photourl_3;
	
	@Column(name = "votenum")
	private Integer votenum;
	
	@Column(name = "tag")
	private String tag;
	
	@Column(name = "school")
	private String school;
	
	@Column(name = "grade")
	private String grade;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "tel")
	private String tel;

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getPhotourl_1() {
		return photourl_1;
	}

	public void setPhotourl_1(String photourl_1) {
		this.photourl_1 = photourl_1;
	}

	public String getPhotourl_2() {
		return photourl_2;
	}

	public void setPhotourl_2(String photourl_2) {
		this.photourl_2 = photourl_2;
	}

	public String getPhotourl_3() {
		return photourl_3;
	}

	public void setPhotourl_3(String photourl_3) {
		this.photourl_3 = photourl_3;
	}

	public Integer getVotenum() {
		return votenum;
	}

	public void setVotenum(Integer votenum) {
		this.votenum = votenum;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	
}
