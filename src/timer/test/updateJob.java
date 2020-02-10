package timer.test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import bar.model.ProductDataService;

@Repository
//@Component("quartztask")
@Transactional
public class updateJob {
	@Autowired
	private ProductDataService proS;
//	private ProductData proD;
	public void updateJob() {
		Thread thread = new Thread(new Runnable() {
			@Override
			public void run() {
				try {
					System.out.println("Status checking...");
					updateDB();
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("Error 1");
				}
			}
		});
		thread.setName("updateJob");
		thread.start();
	}
	
	protected void updateDB() {
//		proS.autoUpdateStatus();
		System.out.println("每5秒顯示一次:Test123.");
	}

//	private SessionFactory sessionFactory;
//	
//	@Autowired
//	public QuartzTask3(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
//		this.sessionFactory = sessionFactory;
//	}
//	
//	@Scheduled
//	@Transactional
//	public void autoUpdateStatus() {
//		System.out.println("每5秒顯示一次:Test123456.");
//		
//		Session session = sessionFactory.getCurrentSession();
//		System.out.println("每5秒顯示一次:Test1234567.");
//		
//		String hqlStr = "select pd.pdId, pd.autoLaunchTime, pd.autoPullTime from ProductData as pd";
//		Query query = session.createQuery(hqlStr);
//		System.out.println("每5秒顯示一次:Test1234568.");
//		
//		List<ProductData> products = (List<ProductData>)query.list();
//		System.out.println("每5秒顯示一次:Test1234569.");
//		
//
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//		Date date = new Date();
//		String nowTime = sdf.format(date);
//
//		String pdAvailable = "";
//
//		for (ProductData product : products) {
//			String autoLaunchTime = product.getAutoLaunchTime();
//			String autoPullTime = product.getAutoPullTime();
//			String pdId = product.getPdId();
//
//			try {
//				Date nowT = sdf.parse(nowTime);
//				Date aLT = sdf.parse(autoLaunchTime);
//				Date apT = sdf.parse(autoPullTime);
//
//				if (autoLaunchTime.length() != 0 && autoPullTime.length() != 0) {
//					if (aLT.before(nowT)) {
//						if (nowT.before(apT)) {
//							pdAvailable = "Launched";
//							Session session1 = sessionFactory.getCurrentSession();
//							try {
//								String hqlStr1 = "update ProductData set autoLaunchTime=:alTm, autoPullTime=:apTm, pdAvailable=:pdA where pdId=:pdId";
//								Query query1 = session1.createQuery(hqlStr1);
//								query1.setParameter("alTm", autoLaunchTime);
//								query1.setParameter("apTm", autoPullTime);
//								query1.setParameter("pdA", pdAvailable);
//								query1.setParameter("pdId", pdId);
//								query1.executeUpdate();
//							} catch (Exception e) {
//								System.out.println("e" + e);
//							}
//						} else {
//							pdAvailable = "Pulled";
//							Session session2 = sessionFactory.getCurrentSession();
//							try {
//								String hqlStr2 = "update ProductData set autoLaunchTime=:alTm, autoPullTime=:apTm, pdAvailable=:pdA where pdId=:pdId";
//								Query query2 = session2.createQuery(hqlStr2);
//								query2.setParameter("alTm", autoLaunchTime);
//								query2.setParameter("apTm", autoPullTime);
//								query2.setParameter("pdA", pdAvailable);
//								query2.setParameter("pdId", pdId);
//								query2.executeUpdate();
//							} catch (Exception e) {
//								System.out.println("e" + e);
//							}
//						}
//					} else {
//						if (nowT.before(apT)) {
//							pdAvailable = "Pulled";
//							Session session3 = sessionFactory.getCurrentSession();
//							try {
//								String hqlStr3 = "update ProductData set autoLaunchTime=:alTm, autoPullTime=:apTm, pdAvailable=:pdA where pdId=:pdId";
//								Query query3 = session3.createQuery(hqlStr3);
//								query3.setParameter("alTm", autoLaunchTime);
//								query3.setParameter("apTm", autoPullTime);
//								query3.setParameter("pdA", pdAvailable);
//								query3.setParameter("pdId", pdId);
//								query3.executeUpdate();
//							} catch (Exception e) {
//								System.out.println("e" + e);
//							}
//						} else {
//							pdAvailable = "Pulled";
//							Session session4 = sessionFactory.getCurrentSession();
//							try {
//								String hqlStr4 = "update ProductData set autoLaunchTime=:alTm, autoPullTime=:apTm, pdAvailable=:pdA where pdId=:pdId";
//								Query query4 = session4.createQuery(hqlStr4);
//								query4.setParameter("alTm", autoLaunchTime);
//								query4.setParameter("apTm", autoPullTime);
//								query4.setParameter("pdA", pdAvailable);
//								query4.setParameter("pdId", pdId);
//								query4.executeUpdate();
//							} catch (Exception e) {
//								System.out.println("e" + e);
//							}
//						}
//					}
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		System.out.println("每5秒顯示一次:Test123.");
//	}
}
