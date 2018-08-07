package goddess.dao;

import goddess.entity.Campaigner;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("campaignerDao")
@Transactional
public class CampaignerDao {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	
	public List<Campaigner> getCampByTag(String tag)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From Campaigner campaigner where campaigner.tag like :tag  order by campaigner.votenum desc").setParameter("tag", "%"+tag+"%");
		List<Campaigner> list =  query.list();
		return list;
	}
	
	public List<Campaigner> getAllCamp()
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From Campaigner campaigner order by campaigner.votenum desc");
		return query.list();
	}
	
	public void saveOrUpdate(Campaigner camp)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(camp);
	}
	
	public Campaigner getCampByOpenId(String openid)
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("From Campaigner campaigner where campaigner.openid = :openid").setParameter("openid", openid);
		List<Campaigner> list = query.list();
		if(list.size() == 0)
			return null;
		else
			return list.get(0);
	}

}
