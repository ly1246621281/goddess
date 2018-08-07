package goddess.service;

import goddess.dao.CampaignerDao;
import goddess.dao.UserDao;
import goddess.entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("userService")
@Transactional
public class UserService {
	@Autowired
	@Qualifier("userDao")
	private UserDao userDao;
	
	public User getUserByOpenId(String openid)
	{
		return userDao.getUserByOpenId(openid);
	}
	
	public void save(User user)
	{
		User oldUser = userDao.getUserByOpenId(user.getOpenid());
		if(oldUser != null)
		{
			oldUser.setCity(user.getCity());
			oldUser.setCountry(user.getCountry());
			oldUser.setHeadimgurl(user.getHeadimgurl());
			oldUser.setNickname(user.getNickname());
			oldUser.setProvince(user.getProvince());
			oldUser.setSex(user.getSex());
			userDao.saveorupdate(oldUser);
		}
		else
			userDao.saveorupdate(user);
	}
	
	public void freshInfo(User user)
	{
		User oldUser = getUserByOpenId(user.getOpenid());
		user.setHasvote(oldUser.getHasvote());
		user.setHasrepost(oldUser.getHasrepost());
		userDao.saveorupdate(user);
	}
	
	public void vote(User user,String selected)
	{
		userDao.vote(user, selected);
	}
	
	public void repost(User user)
	{
		user.setHasrepost(1);
		userDao.saveorupdate(user);
	}
	
}
