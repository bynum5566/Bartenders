package bar.model.logistic;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
@Repository
public class ActivityDAO {

	private SessionFactory sessionFactory;

@Autowired
	public ActivityDAO(@Qualifier("sessionFactory")SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Participant saveParticipant(Integer activityId,Integer userId, String name, String phone,Integer together) {
		try {
		Session session = sessionFactory.getCurrentSession();
		Participant p = new Participant();
		p.setActivityId(activityId);
		p.setUserId(userId);
		p.setName(name);
		p.setPhone(phone);
		p.setTogether(together);
		session.save(p);
		System.out.println("Participant has been saved!");
		return p;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	public List<Participant> queryParticipant(Integer activityId) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Participant where activityId=:activityId";
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter("activityId", activityId);
		List<Participant> rs = query.list();
		System.out.println("result: "+rs);
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}


	public Activity uniqueQuery(String param,Object obj) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String Param = param+"=:"+param;
		String hqlStr = "from Activity where "+Param;
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter(param, obj);
		Activity rs = (Activity)query.uniqueResult();
		System.out.println("unique result: "+rs);
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}

	public List<Activity> simpleQuery(String condition) {
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery(condition);
			List<Activity> rs = query.list();
			System.out.println("query result: "+rs);
			return rs;
			}catch(Exception e) {
				System.out.println("e:"+e);
				return null;
			}
		}

	public List<Activity> query(String condition, Object obj) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String Param = condition+"=:"+condition;
		String hqlStr = "from Activity where "+Param;
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter(condition, obj);
		List<Activity> rs = query.list();
		System.out.println("query result: "+rs);
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	public List<Activity> query(String condition,Object obj,String condition2,Object obj2) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String param = condition+"=:"+condition;
		String param2 = condition2+"=:"+condition2;
		String hqlStr = "from Activity where "+param+" and "+param2;
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter(condition, obj);
		query.setParameter(condition2, obj2);
		List<Activity> rs = query.list();
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	public List<Activity> query(String condition,Object obj,String condition2,Object obj2,String condition3,Object obj3) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String param = condition+"=:"+condition;
		String param2 = condition2+"=:"+condition2;
		String hqlStr = "from Activity where "+param+" and "+param2;
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter(condition, obj);
		query.setParameter(condition2, obj2);
		query.setParameter(condition3, obj3);
		List<Activity> rs = query.list();
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	
	
	public Activity saveActivity(Activity a,Integer userId, String name, String address, float lat, float lng, String type,
			String img,String brief,String content,String beginTime,String endTime,Integer limitNum,Integer targetNum,Integer actualNum) {
		try {
		Session session = sessionFactory.getCurrentSession();
		
		a.setUserId(userId);
		a.setName(name);
		a.setAddress(address);
		a.setLat(lat);
		a.setLng(lng);
		a.setType(type);
		a.setImg(img);
		
		a.setBrief(brief);
		a.setContent(content);
		a.setBeginTime(beginTime);
		a.setEndTime(endTime);
		a.setStatus("O");
		if(limitNum==null) {
			a.setLimitNum(999);
		}else {
			a.setLimitNum(limitNum);
		};
		if(targetNum==null) {
			a.setTargetNum(0);
		}else {
			a.setTargetNum(targetNum);
		};
		if(actualNum==null) {
			a.setActualNum(0);
		}else {
			a.setActualNum(actualNum);
		};
		
		session.save(a);
		System.out.println("Activity has been saved!");
		return a;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	
	
	
	public List<Activity> queryActivityByUserId(Integer userId) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Activity where userId=:userId";
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter("userId", userId);
		List<Activity> rs = query.list();
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	public Activity queryActivityByActivityId(Integer ActivityId) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Activity where ActivityId=:ActivityId";
		System.out.println("hqlStr:"+hqlStr);
		Query query = session.createQuery(hqlStr);
		query.setParameter("ActivityId", ActivityId);
		Activity rs = (Activity)query.uniqueResult();
		return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	public boolean checkEndTime(List<Activity> list) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		Date current = new Date();
		System.out.println(sdf.format(current));
		try {
			for(Activity activity:list) {
				String endTime = activity.getEndTime();
				Date end = sdf.parse(endTime);
				long diff=(end.getTime()-current.getTime())/(1000*60); //以分計算
				if(diff==0||diff<=0) {
					activity.setStatus("N");
				}
			}
		}catch (Exception e){
			System.out.println("e:"+e);
			return false;
		}
		return true;
	}
	

}
