package bar.controller.logistic;


import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.omg.PortableInterceptor.ForwardRequest;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bar.model.logistic.Logistic;
import bar.model.logistic.LogisticService;
import bar.model.logistic.Bar;
import bar.model.logistic.BarDAO;

import net.coobird.thumbnailator.Thumbnails;
import bar.model.logistic.Activity;
import bar.model.logistic.ActivityDAO;
import bar.model.logistic.ActivityService;

@Controller
@SessionAttributes(names="activity")
public class FunctionByXML {

	private ActivityDAO aDao;
	private ActivityService aSer;
	private LogisticService lSer;
	
	public FunctionByXML(ActivityDAO aDao,ActivityService aSer,LogisticService lSer) {
		this.aDao=aDao;
		this.aSer=aSer;
		this.lSer=lSer;
	}


//	@RequestMapping(path = "Activitytest.do",method = RequestMethod.GET)
	@RequestMapping(path = "ActivityJoker/{Object}",method = RequestMethod.GET)
	public @ResponseBody List<Activity> ActivityJoker(Model m,HttpServletRequest request, HttpServletResponse response,
			@PathVariable(value = "Object")List obj
			) throws ParseException {
		System.out.println("ActivityJoker start");
		System.out.println("Object is: "+obj);
		List<Activity> all = aSer.queryAll();
		boolean status = aSer.checkEndTime(all);
		System.out.println("all activities is checked: "+status);
		List<Activity> checkList = new ArrayList<Activity>();
		List<Activity> temp;
		for(int i=0;i<4;i++) {
			Object x = obj.get(i);
			if(x.toString().equals("null")) {
				System.out.println("object["+i+"] is null");
			}else {
				temp = aSer.queryJoker("type","'"+x.toString()+"'");
				checkList.addAll(temp);
			}
		}
		System.out.println("type with qualify result: "+checkList);
		//日期類
		List<Activity> activity = new ArrayList<Activity>();
		if(!obj.get(4).toString().equals("null")) {
			
		
		Date immediatlyD = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		Date beginD = sdf.parse(obj.get(4).toString());
		Date endD = sdf.parse(obj.get(5).toString());
		//進行轉換
		long period = (endD.getTime()-beginD.getTime())/1000/60;
		System.out.println("time diff between now & begin: "+period+"min");
		
		for(Activity a:checkList) {
			Date aBeginD = sdf2.parse(a.getBeginTime());
			Date aEndD = sdf2.parse(a.getEndTime());
			System.out.println("this activity's time is: "+aBeginD+" to "+aEndD);
			Date x;
			Date y;
			if(beginD.before(aBeginD)) {
				x = aBeginD;
			}else {
				x = beginD;
			}
			if(endD.before(aEndD)) {
				y = endD;
			}else {
				y = aEndD;
			}
			
			long xLength = x.getTime()-immediatlyD.getTime();
			long yLength = y.getTime()-immediatlyD.getTime();
			if(yLength-xLength>0) {
				System.out.println("this activity is not qualify with selected time period");
				activity.add(a);
			}
		}
		}else {
			System.out.println("time is not selected");
		}
		System.out.println("final result: "+activity);
//		activity = aSer.queryJoker("userId",userId,"status","O");
		if(obj.get(4).toString().equals("null")) {
			return checkList;
		}else {
			return activity;
		}
		
	}
	
	
	@RequestMapping(path = "ActivityUserId/{userId}",method = RequestMethod.GET)
	public @ResponseBody List<Activity> ActivityUserId(@PathVariable Integer userId,Model m,
			HttpServletRequest request, HttpServletResponse response) throws ParseException {
		System.out.println("start to query");
//		System.out.println("this is url: Activity/"+search+"/"+userId);
		List<Activity> list = aDao.query("userId",userId);
		boolean status = aDao.checkEndTime(list);
		System.out.println("all activities is checked: "+status);
		
		List<Activity> activity = aDao.query("userId",userId,"status","O");
		return activity;
	}
	
	@RequestMapping(path = "ActivityActivityId/{activityId}",method = RequestMethod.GET)
	public @ResponseBody List<Activity> ActivityActivityId(@PathVariable Integer activityId,Model m,
			HttpServletRequest request, HttpServletResponse response) throws ParseException {
		System.out.println("start to query");
//		System.out.println("this is url: Activity/"+search+"/"+userId);
		List<Activity> list = aDao.query("activityId",activityId);
		boolean status = aDao.checkEndTime(list);
		System.out.println("all activities is checked: "+status);
		
		List<Activity> activity = aDao.query("activityId",activityId,"status","O");
		return activity;
	}
	
	@RequestMapping(path = "ActivityType/{type}",method = RequestMethod.GET)
	public @ResponseBody List<Activity> ActivityType(@PathVariable String type,
			HttpServletRequest request, HttpServletResponse response) throws ParseException {
		System.out.println("start to query");
//		System.out.println("this is url: Activity/"+search+"/"+userId);
		List<Activity> list = aDao.query("type",type);
		boolean status = aDao.checkEndTime(list);
		System.out.println("all activities is checked: "+status);
		List<Activity> activity = aDao.query("type",type,"status","O");
		return activity;
	}
	
	@RequestMapping(path = "ActivityDate/{begin}/{end}",method = RequestMethod.GET)
	public @ResponseBody List<Activity> ActivityDate(
			@PathVariable(value = "begin")String begin,
			@PathVariable(value = "end")String end,
			HttpServletRequest request, HttpServletResponse response) throws ParseException {
		System.out.println("start to query");
		Date immediatlyD = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		//進行轉換

		System.out.println("immediatly: "+sdf2.format(immediatlyD)+"begin: "+begin+"end: "+end);
		System.out.println(immediatlyD);
		Date beginD = sdf.parse(begin);
		System.out.println(beginD);
		
		Date endD = sdf.parse(end);
		
//		System.out.println(endD);
		long diff = (beginD.getTime()-immediatlyD.getTime())/1000/60;
		long period = (endD.getTime()-beginD.getTime())/1000/60;
		System.out.println("time diff between now & begin: "+period+"min");
//		System.out.println("this is url: Activity/"+search+"/"+userId);
		List<Activity> all = aSer.queryAll();
		boolean status = aSer.checkEndTime(all);
		System.out.println("all activities is checked: "+status);
		List<Activity> active = aSer.queryJoker("status","'O'");
		List<Activity> activity = new ArrayList<Activity>();
		for(Activity a:active) {
			Date aBeginD = sdf2.parse(a.getBeginTime());
			Date aEndD = sdf2.parse(a.getEndTime());
			Date x;
			Date y;
			if(beginD.before(aBeginD)) {
				x = aBeginD;
			}else {
				x = beginD;
			}
			if(endD.before(aEndD)) {
				y = endD;
			}else {
				y = aEndD;
			}
			
			long xLength = x.getTime()-immediatlyD.getTime();
			long yLength = y.getTime()-immediatlyD.getTime();
			if(yLength-xLength>0) {
				activity.add(a);
			}
		}
		System.out.println("final result: "+activity);
		return activity;
	}

	@RequestMapping(path = "OrderSearch/{status}",method = RequestMethod.GET)
	public @ResponseBody List<Activity> searchOrder(@PathVariable Integer status,HttpServletRequest request, HttpServletResponse response, Model m
			) throws IOException, ParseException {
		List<Logistic> newOrder = lSer.queryByStatus(status);
		System.out.println("order numbers: "+newOrder.size());
		HashMap<String,Integer> hashMap = new HashMap<>();
		List<Activity> activity = new ArrayList<Activity>();
		Activity temp;
		for(Logistic a:newOrder) {
			String cID = a.getcID();
			hashMap.putIfAbsent(cID,0);
			hashMap.put(cID,hashMap.get(cID)+1);
			
		}
		System.out.println("hashMap is: "+hashMap);
		Iterator<Map.Entry<String, Integer>> iterator = hashMap.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<String, Integer> entry = iterator.next();
			Integer barId = Integer.parseInt(entry.getKey());
			Integer orderNum = entry.getValue();
			System.out.println("start query with userId: "+barId+" &set num:"+orderNum);
			temp = aSer.uniqueQuery("userId", barId);
			temp.setOrderNum(orderNum);
			activity.add(temp);
		}

		m.addAttribute("activity",activity);
		return activity;
	}
	
	

}
