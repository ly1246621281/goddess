package goddess.dao;

import goddess.entity.Campaigner;
import goddess.entity.User;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.classic.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("userDao")
@Transactional
public class UserDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public void saveorupdate(User user)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(user);
	}
	
	
	public User getUserByOpenId(String openid)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From User user where user.openid = :openid").setParameter("openid", openid);
		List<User> list = query.list();
		if(list.size() == 0)
			return null;
		else
			return list.get(0);
	}
	
	public void vote(User user,String selected)
	{
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Query query = session.createQuery("From Campaigner campaigner where campaigner.openid = :openid").setParameter("openid", selected);
		List<Campaigner> list = query.list();
		if(list.size() != 0)
		{
			Campaigner camp = list.get(0);
			camp.setVotenum(camp.getVotenum() + 1);
			session.saveOrUpdate(camp);
		}
		user.setHasvote(user.getHasvote() + 1);
		session.saveOrUpdate(user);
		tx.commit();
	}

}
