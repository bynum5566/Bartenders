package bar.model.logistic;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
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
public class BarDAO {

	private SessionFactory sessionFactory;

@Autowired
	public BarDAO(@Qualifier("sessionFactory")SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Bar> query(String condition,Object obj) {
		try {
		Session session = sessionFactory.getCurrentSession();

			String Param = condition+"=:"+condition;
			String hqlStr = "from Bar where "+Param;
			System.out.println("hqlStr:"+hqlStr);
			Query query = session.createQuery(hqlStr);
			query.setParameter(condition, obj);
			List<Bar> rs = query.list();
			return rs;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	
	
	


	
	public Bar createLocation(String name, String address, float lat, float lng, String type,
			String img,String brief,String beginTime,String endTime) {
		try {
		Session session = sessionFactory.getCurrentSession();
		String hqlStr = "from Bar";
		Query query = session.createQuery(hqlStr);
		Bar b = new Bar();
		b.setName(name);
		b.setAddress(address);
		b.setLat(lat);
		b.setLng(lng);
		b.setType(type);
		b.setBrief(brief);
		b.setImg(img);
		b.setBeginTime(beginTime);
		b.setEndTime(endTime);
		b.setStatus("open");
		session.save(b);
		System.out.println("Bar location has been saved!");
		return b;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}

}
