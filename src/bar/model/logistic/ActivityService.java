package bar.model.logistic;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import bar.model.logistic.ActivityDAO;
@Service
public class ActivityService {

	private ActivityDAO aDao;

	@Autowired
	public ActivityService(ActivityDAO aDao) {
		this.aDao = aDao;
	}
	
	//儲存參加者名單
	public Participant saveParticipant(Integer activityId,Integer userId, String name, String phone, Integer together) {
		return aDao.saveParticipant(activityId,userId, name, phone, together);
	}
	//搜尋參加者名單
	public List<Participant> queryParticipant(Integer activityId) {
		return aDao.queryParticipant(activityId);
	}
	
	//queryJoker(activityId,1002)
	public List<Activity> queryJoker(Object Param,Object obj) {
		//"from Activity where activityId=1002"
		String condition = "from Activity where "+Param+"="+obj;
		System.out.println("searching condition: "+condition);
		List<Activity> first = aDao.simpleQuery(condition);
		return first;
	}
	
	public List<Activity> queryJoker(Object Param,Object obj,Object Param2,Object obj2) {
		//"from Activity where activityId=1002"
		String condition = "from Activity where "+Param+"="+obj+" and "+Param2+"="+obj2;
		System.out.println("searching condition: "+condition);
		List<Activity> first = aDao.simpleQuery(condition);
		return first;
	}
	
	public Activity uniqueQuery(String Param,Object obj) {
		Activity unique = aDao.uniqueQuery(Param, obj);
		return unique;
	}
	
	//addJoin(activityId,1002,1) 10/7 +4 10/11
	public List<Activity> addJoin(Object Param,Object obj, Integer num) {
		//"from Activity where activityId=1002 and actualNum"
		try {
			String condition = "from Activity where "+Param+"="+obj;
			List<Activity> target = aDao.simpleQuery(condition);
			for(Activity a:target) {
				Integer actualNum = a.getActualNum();
				Integer targetNum = a.getTargetNum();
				if(actualNum<targetNum) {
					a.setActualNum(actualNum+num);
					
				}else {
					System.out.println("activity has reached its limit");
					return null;
				}
			}
			return target;
		}catch(Exception e) {
			System.out.println("e:"+e);
			return null;
		}
	}
	
	
	public Activity saveActivity(Activity a,Integer userId, String name, String address, float lat, float lng, String type,
			String img,String brief,String beginTime,String endTime,Integer limitNum,Integer targetNum,Integer actualNum) {
		return aDao.saveActivity(a, userId, name, address, lat, lng, type, img, brief, beginTime, endTime, limitNum, targetNum, actualNum);
	}
	
	public boolean checkEndTime(List<Activity> list) {
		return aDao.checkEndTime(list);
	}
	
	public List<Activity> queryAll() {
		String condition = "from Activity";
		System.out.println("searching condition: "+condition);
		List<Activity> all = aDao.simpleQuery(condition);
		return all;
	}
	
	public static boolean DateIncluding(Date targetTime, Date startTime, Date endTime) {
	    if (targetTime.getTime() == startTime.getTime()
	            || targetTime.getTime() == endTime.getTime()) {
	        return true;
	    }
	    Calendar date = Calendar.getInstance();
	    date.setTime(targetTime);
	    Calendar begin = Calendar.getInstance();
	    begin.setTime(startTime);
	    Calendar end = Calendar.getInstance();
	    end.setTime(endTime);
	    if (date.after(begin) && date.before(end)) {
	        return true;
	    } else {
	        return false;
	    }
	}

}
