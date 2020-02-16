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
	
	public boolean insert(ProductData proD) {
		Session session = sessionFactory.getCurrentSession();
		if (proD != null) {
			session.save(proD);
			return true;
		}
		return false;
	}
	/*找這個酒吧的一般上架商品，不含QR*/
	public List<ProductData> selectPdsLaunched(int companyId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String nowTime = sdf.format(date);
		
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime < :nowTime and  autoPullTime > :nowTime ) or ( autoLaunchTime < :nowTime and autoLaunchTime > autoPullTime ) or ( autoLaunchTime < :nowTime and autoPullTime is null ) ) and validDate is null";
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
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime > :nowTime and autoLaunchTime < autoPullTime ) or ( autoLaunchTime > :nowTime and autoPullTime > :nowTime ) or ( autoPullTime < :nowTime and autoPullTime > autoLaunchTime ) or ( autoLaunchTime > :nowTime and autoPullTime is null ) ) and validDate is null";
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
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime < :nowTime and autoPullTime > :nowTime ) or ( autoLaunchTime < :nowTime and autoLaunchTime > autoPullTime ) or ( autoLaunchTime < :nowTime and autoPullTime is null ) ) and validDate is not null";
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
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime > :nowTime and autoLaunchTime < autoPullTime ) or ( autoLaunchTime > :nowTime and autoPullTime > :nowTime ) or ( autoPullTime < :nowTime AND autoPullTime > autoLaunchTime ) or ( autoLaunchTime > :nowTime and autoPullTime is null ) ) and validDate is not null";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		query.setParameter("nowTime", nowTime);

		return (List<ProductData>) query.list();
	}
	
	public List<ProductData> searchPds(String keyword){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");	
		Date date = new Date();	
		String nowTime = sdf.format(date);
		keyword= "%"+keyword+"%";
		
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where (productName like :kWord or pdTag1 like :kWord or pdTag2 like :kWord or pdTag3 like :kWord) and  ( ( autoLaunchTime < :nowTime and autoPullTime > :nowTime ) or ( autoLaunchTime < :nowTime and autoLaunchTime > autoPullTime ) or ( autoLaunchTime < :nowTime and autoPullTime is null ) )";
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
		String hqlStr = "from ProductData where companyId=:cId and ( ( autoLaunchTime < :nowTime and autoPullTime > :nowTime ) or ( autoLaunchTime < :nowTime and autoLaunchTime > autoPullTime ) or ( autoLaunchTime < :nowTime and autoPullTime is null ) )";	
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
	
	public List<ProductData> selectAvailable(){
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "select pd.pdId, pd.autoLaunchTime, pd.autoPullTime from ProductData as pd";
		Query query = session.createQuery(hqlStr);
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
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = new Date();
		String strDate = sdf.format(date);
		Session session = sessionFactory.getCurrentSession();
		try {
			Date a = sdf.parse(autoLaunchTime);
			Date b = sdf.parse(strDate);
			if (a.after(b)) {
				String hqlStr = "update ProductData set autoLaunchTime=:alTm, pdAvailable=:pdA where pdId=:pdId";
				Query query = session.createQuery(hqlStr);
				query.setParameter("alTm", autoLaunchTime);
				query.setParameter("pdA", "Launched");
				query.setParameter("pdId", pdId);
				query.executeUpdate();
			} else {
				String hqlStr = "update ProductData set autoLaunchTime=:alTm where pdId=:pdId";
				Query query = session.createQuery(hqlStr);
				query.setParameter("alTm", autoLaunchTime);
				query.setParameter("pdId", pdId);
				query.executeUpdate();
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public void editAPullT(String autoPullTime, String pdId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = new Date();
		String strDate = sdf.format(date);
		Session session = sessionFactory.getCurrentSession();
		try {
			Date a = sdf.parse(autoPullTime);
			Date b = sdf.parse(strDate);
			if (a.before(b)) {
				String hqlStr = "update ProductData set autoPullTime=:apTm, pdAvailable=:pdA where pdId=:pdId";
				Query query = session.createQuery(hqlStr);
				query.setParameter("apTm", autoPullTime);
				query.setParameter("pdA", "Pulled");
				query.setParameter("pdId", pdId);
				query.executeUpdate();
			} else {
				String hqlStr = "update ProductData set autoPullTime=:apTm where pdId=:pdId";
				Query query = session.createQuery(hqlStr);
				query.setParameter("apTm", autoPullTime);
				query.setParameter("pdId", pdId);
				query.executeUpdate();
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	public void editALaunchPullT(String autoLaunchTime, String autoPullTime, String pdId) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		Date date = new Date();
		String strDate = sdf.format(date);
		Session session = sessionFactory.getCurrentSession();
		try {
			Date a = sdf.parse(autoPullTime);
			Date c = sdf.parse(autoLaunchTime);
			Date b = sdf.parse(strDate);
			if (c.before(b)) {
				if (a.after(b)) {
					String hqlStr = "update ProductData set autoLaunchTime=:alTm, autoPullTime=:apTm, pdAvailable=:pdA where pdId=:pdId";
					Query query = session.createQuery(hqlStr);
					query.setParameter("alTm", autoLaunchTime);
					query.setParameter("apTm", autoPullTime);
					query.setParameter("pdA", "Launched");
					query.setParameter("pdId", pdId);
					query.executeUpdate();
				} else {
					String hqlStr = "update ProductData set autoLaunchTime=:alTm, autoPullTime=:apTm, pdAvailable=:pdA where pdId=:pdId";
					Query query = session.createQuery(hqlStr);
					query.setParameter("alTm", autoLaunchTime);
					query.setParameter("apTm", autoPullTime);
					query.setParameter("pdA", "Pulled");
					query.setParameter("pdId", pdId);
					query.executeUpdate();
				}
			} else {
				String hqlStr = "update ProductData set autoLaunchTime=:alTm, autoPullTime=:apTm, pdAvailable=:pdA where pdId=:pdId";
				Query query = session.createQuery(hqlStr);
				query.setParameter("alTm", autoLaunchTime);
				query.setParameter("apTm", autoPullTime);
				query.setParameter("pdA", "Pulled");
				query.setParameter("pdId", pdId);
				query.executeUpdate();
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
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
	
	///==================豪===

	public List<ProductData> selectPds(int companyId, String pdAvailable) {//豪
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from ProductData where companyId=:cId and pdAvailable=:pdA";
		Query query = session.createQuery(hqlStr);
		query.setParameter("cId", companyId);
		query.setParameter("pdA", pdAvailable);
		return (List<ProductData>) query.list();
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
