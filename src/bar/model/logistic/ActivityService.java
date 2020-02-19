package bar.model.logistic;

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
	//queryJoker(activityId,1002)
	public List<Activity> queryJoker(Object Param,Object obj) {
		//"from Activity where activityId=1002"
		String condition = "from Activity where "+Param+"="+obj;
		System.out.println("searching condition: "+condition);
		List<Activity> first = aDao.simpleQuery(condition);
		return first;
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
	
	
	public Activity saveActivity(Activity a,String userId, String name, String address, float lat, float lng, String type,
			String img,String brief,String beginTime,String endTime,Integer targetNum,Integer actualNum) {
		return aDao.saveActivity(a, userId, name, address, lat, lng, type, img, brief, beginTime, endTime, targetNum, actualNum);
	}

}
