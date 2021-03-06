package bar.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDataDAO {
	private SessionFactory sessionFactory;
	private ProductData proD;
	
	public ProductDataDAO() {
	}
	
	@Autowired
	public ProductDataDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public boolean updateQuantityByPid(String pdId, int pdSoldQuantity) {//	used by finishPay
		try
		{
			Session session = sessionFactory.getCurrentSession();
			String hqlStr = "update ProductData set pdSoldQuantity=:pdSoldQuantity where pdId=:pdId";
			Query query = session.createQuery(hqlStr);
			query.setParameter("pdId", pdId);
			query.setParameter("pdSoldQuantity", pdSoldQuantity);
			query.executeUpdate();
			return true;
		} catch (Exception e)
		{
			System.out.println("【pdDAO.updateQuantityByPid】【error】");
			System.out.println("【Exception = 】" + e);
			System.out.println("【e.printStackTrace = 】" + e);
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean insert(ProductData proD) {
		Session session = sessionFactory.getCurrentSession();
		if (proD != null) {
			session.save(proD);
			return true;
		}
		return false;
	}

	public List<ProductData> selectPdsLaunched(int companyId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String nowTime = sdf.format(date);
		
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime < :nowTime and  autoPullTime > :nowTime ) or ( autoLaunchTime < :nowTime and autoLaunchTime > autoPullTime ) or ( autoLaunchTime < :nowTime and autoPullTime is null ) ) and validDate is null and deleteTag is null order by autoLaunchTime DESC";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		query.setParameter("nowTime", nowTime);

		return (List<ProductData>) query.list();
	}
	
	public List<ProductData> selectPdsPulled(int companyId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String nowTime = sdf.format(date);
		
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime > :nowTime and autoLaunchTime < autoPullTime ) or ( autoLaunchTime > :nowTime and autoPullTime < :nowTime ) or ( autoPullTime < :nowTime and autoPullTime > autoLaunchTime ) or ( autoLaunchTime > :nowTime and autoPullTime is null ) ) and validDate is null and deleteTag is null order by autoLaunchTime DESC";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		query.setParameter("nowTime", nowTime);

		return (List<ProductData>) query.list();
	}
	
	public List<ProductData> selectTKPdsLaunched(int companyId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String nowTime = sdf.format(date);
		
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime < :nowTime and autoPullTime > :nowTime ) or ( autoLaunchTime < :nowTime and autoLaunchTime > autoPullTime ) or ( autoLaunchTime < :nowTime and autoPullTime is null ) ) and validDate is not null and deleteTag is null order by autoLaunchTime DESC";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		query.setParameter("nowTime", nowTime);

		return (List<ProductData>) query.list();
	}
	
	public List<ProductData> selectTKPdsPulled(int companyId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String nowTime = sdf.format(date);
		
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime > :nowTime and autoLaunchTime < autoPullTime ) or ( autoLaunchTime > :nowTime and autoPullTime < :nowTime ) or ( autoPullTime < :nowTime AND autoPullTime > autoLaunchTime ) or ( autoLaunchTime > :nowTime and autoPullTime is null ) ) and validDate is not null and deleteTag is null order by autoLaunchTime DESC";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		query.setParameter("nowTime", nowTime);

		return (List<ProductData>) query.list();
	}
	
	public List<ProductData> searchPds(String keyword){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");	
		Date date = new Date();	
		String nowTime = sdf.format(date);
		
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where (upper(productName) like '%' || upper(:kWord)  || '%' or upper(pdTag1) like '%' || upper(:kWord)  || '%' or upper(pdTag2) like '%' || upper(:kWord)  || '%' or upper(pdTag3) like '%' || upper(:kWord)  || '%' or upper(pdDetail) like '%' || upper(:kWord)  || '%') and  ( ( autoLaunchTime < :nowTime and autoPullTime > :nowTime ) or ( autoLaunchTime < :nowTime and autoLaunchTime > autoPullTime ) or ( autoLaunchTime < :nowTime and autoPullTime is null ) ) order by autoLaunchTime DESC";
		Query query = session.createQuery(hqlStr);
		query.setParameter("kWord",keyword);
		query.setParameter("nowTime", nowTime);	
		return (List<ProductData>)query.list();
		}
	
	public List<ProductData> selectTop3(int companyId) {	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");	
		Date date = new Date();	
		String nowTime = sdf.format(date);	
			
		Session session = sessionFactory.getCurrentSession();	
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime < :nowTime and autoPullTime > :nowTime ) or ( autoLaunchTime < :nowTime and autoLaunchTime > autoPullTime ) or ( autoLaunchTime < :nowTime and autoPullTime is null ) ) and deleteTag is null";	
		Query query = session.createQuery(hqlStr);	
		query.setParameter("cId", companyId);	
		query.setParameter("nowTime", nowTime);	
		query.setMaxResults(3);	
			
		return (List<ProductData>) query.list();	
	}
	
	public ProductData selectP(String pdId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where pdId=:pdId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("pdId", pdId);
		return (ProductData) query.uniqueResult();
	}

	public ProductData selectProduct(int companyId, String pdId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId=:cId and pdId=:pdId and validDate is null";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		query.setParameter("pdId", pdId);
		return (ProductData) query.uniqueResult();
	}
	
	public ProductData selectTKProduct(int companyId, String pdId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId=:cId and pdId=:pdId and validDate is not null";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		query.setParameter("pdId", pdId);
		return (ProductData) query.uniqueResult();
	}
	
	public List<ProductData> selectAllProducts(int companyId){
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId =: cId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		return (List<ProductData>)query.list();
	}

	public boolean edit(String pdId, String productName, String pdTag1, String pdTag2, String pdTag3, int pdStock,
			int pdPrice, String pdDetail, String productImageUrl, String productImageUrl2, String productImageUrl3) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update ProductData set productName=:pName, pdTag1=:pTg1, pdTag2=:pTg2, pdTag3=:pTg3, pdStock=:pStk,"
				+ " pdPrice=:pPri, pdDetail=:pDtl, productImageUrl=:piUrl, productImageUrl2=:piUrl2, productImageUrl3=:piUrl3 where pdId=:pdId";
		try {
			Query query = session.createQuery(hqlStr);
			query.setParameter("pName", productName);
			query.setParameter("pTg1", pdTag1);
			query.setParameter("pTg2", pdTag2);
			query.setParameter("pTg3", pdTag3);
			query.setParameter("pStk", pdStock);
			query.setParameter("pPri", pdPrice);
			query.setParameter("pDtl", pdDetail);
			query.setParameter("piUrl", productImageUrl);
			query.setParameter("piUrl2", productImageUrl2);
			query.setParameter("piUrl3", productImageUrl3);
			query.setParameter("pdId", pdId);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("e" + e);
			e.printStackTrace();
		}
		return false;
	}
	
	public void editValidT(String validDate, String pdId) {
		Session session = sessionFactory.getCurrentSession();
					String hqlStr = "update ProductData set validDate=:vlDt where pdId=:pdId";
					Query query = session.createQuery(hqlStr);
					query.setParameter("vlDt", validDate);
					query.setParameter("pdId", pdId);
					query.executeUpdate();
	}
	
	public void editExpiryT(String expiryDate, String pdId) {
		Session session = sessionFactory.getCurrentSession();
					String hqlStr = "update ProductData set expiryDate=:epDt where pdId=:pdId";
					Query query = session.createQuery(hqlStr);
					query.setParameter("epDt", expiryDate);
					query.setParameter("pdId", pdId);
					query.executeUpdate();
	}
	
	public void editValidExpiryT(String validDate, String expiryDate, String pdId) {
		Session session = sessionFactory.getCurrentSession();
					String hqlStr = "update ProductData set validDate=:vlDt, expiryDate=:epDt where pdId=:pdId";
					Query query = session.createQuery(hqlStr);
					query.setParameter("vlDt", validDate);
					query.setParameter("epDt", expiryDate);
					query.setParameter("pdId", pdId);
					query.executeUpdate();
	}

	public void editALaunchT(String autoLaunchTime, String pdId) {
		Session session = sessionFactory.getCurrentSession();
				String hqlStr = "update ProductData set autoLaunchTime=:alTm where pdId=:pdId";
				Query query = session.createQuery(hqlStr);
				query.setParameter("alTm", autoLaunchTime);
				query.setParameter("pdId", pdId);
				query.executeUpdate();
	}

	public void editAPullT(String autoPullTime, String pdId) {
		Session session = sessionFactory.getCurrentSession();
				String hqlStr = "update ProductData set autoPullTime=:apTm where pdId=:pdId";
				Query query = session.createQuery(hqlStr);
				query.setParameter("apTm", autoPullTime);
				query.setParameter("pdId", pdId);
				query.executeUpdate();
	}

	public void editALaunchPullT(String autoLaunchTime, String autoPullTime, String pdId) {
		Session session = sessionFactory.getCurrentSession();
					String hqlStr = "update ProductData set autoLaunchTime=:alTm, autoPullTime=:apTm where pdId=:pdId";
					Query query = session.createQuery(hqlStr);
					query.setParameter("alTm", autoLaunchTime);
					query.setParameter("apTm", autoPullTime);
					query.setParameter("pdId", pdId);
					query.executeUpdate();
	}

	public boolean launchP(String autoLaunchTime, String pdId) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String hqlStr = "update ProductData set autoLaunchTime=:alTm where pdId=:pdId";
			Query query = session.createQuery(hqlStr);
			query.setParameter("alTm", autoLaunchTime);
			query.setParameter("pdId", pdId);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("e" + e);
		}
		return false;
	}
	
	public boolean pullP(String autoPullTime, String pdId) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String hqlStr = "update ProductData set autoPullTime=:apTm where pdId=:pdId";
			Query query = session.createQuery(hqlStr);
			query.setParameter("apTm", autoPullTime);
			query.setParameter("pdId", pdId);
			query.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("e" + e);
		}
		return false;
	}
	
	public void removePd(String pdId) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update ProductData set deleteTag=:dTag where pdId=:pdId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("dTag", "deleted");
		query.setParameter("pdId", pdId);
		query.executeUpdate();
	}

	public boolean updateSold(String pdId, int pdSoldQuantity) {
		Session session = sessionFactory.getCurrentSession();
		try {
			String hqlStr = "update ProductData set pdSoldQuantity=:soldQ where pdId=:pdId";
			Query query = session.createQuery(hqlStr);
			query.setParameter("soldQ", proD.getPdSoldQuantity());
			query.setParameter("pdId", proD.getPdId());
			return true;
		} catch (Exception e) {
			System.out.println("e" + e);
		}
		return false;
	}

	public boolean tagSold(String pdId, String pdSoldOut) {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "update ProductData set pdSoldOut=:sold where pdId=:pdId";
		Query query = session.createQuery(hqlStr);
		query.setParameter("sold", proD.getPdSoldOut());
		query.setParameter("pdId", proD.getPdId());
		return true;
	}

	/////////////////////
	
	 public List<ProductData> selectProductof(Integer companyId) {
		  Session session = sessionFactory.getCurrentSession();
		  String hqlStr="from ProductData where companyId=:companyId";
		  Query query = session.createQuery(hqlStr);
		  query.setParameter("companyId", companyId);
		  return (List<ProductData>)query.list();
		 }
	
	
}
