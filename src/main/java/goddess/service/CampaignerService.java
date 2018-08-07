package goddess.service;

import java.util.List;

import goddess.dao.CampaignerDao;
import goddess.entity.Campaigner;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("campaignerService")
@Transactional
public class CampaignerService {
	@Autowired
	@Qualifier("campaignerDao")
	private CampaignerDao campaignerDao;
	
	public List<Campaigner> getCampByTag(String tag)
	{
		return campaignerDao.getCampByTag(tag);
	}
	
	public List<Campaigner> getAllCamp()
	{
		return campaignerDao.getAllCamp();
	}
	
	public void save(Campaigner camp)
	{
		Campaigner oldCamp = campaignerDao.getCampByOpenId(camp.getOpenid());
		if(oldCamp != null)
		{
			oldCamp.setGrade(camp.getGrade());
			oldCamp.setName(camp.getName());
			oldCamp.setPhotourl_1(camp.getPhotourl_1());
			oldCamp.setPhotourl_2(camp.getPhotourl_2());
			oldCamp.setPhotourl_3(camp.getPhotourl_3());
			oldCamp.setSchool(camp.getSchool());
			oldCamp.setTag(camp.getTag());
			oldCamp.setTel(camp.getTel());
			campaignerDao.saveOrUpdate(oldCamp);
		}
		else
			campaignerDao.saveOrUpdate(camp);
	}
	
	public Campaigner getCampByOpenId(String openid)
	{
		return campaignerDao.getCampByOpenId(openid);
	}
	
	

}
