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
		//先更新時間
		List<Activity> all = aSer.queryAll();
		boolean status = aSer.checkEndTime(all);
		System.out.println("all activities is checked: "+status);
		
		//預設找正開放的全部
		List<Activity> finalList = aSer.queryJoker("status", "'O'");
		System.out.println("there are: "+finalList.size()+" activities are currently open.");
		
		//類型類
		boolean checking = false;
		if(obj.contains("bar")||obj.contains("shop")||obj.contains("show")||obj.contains("party")||obj.contains("carnival")||obj.contains("festival")) {
			checking=true;
			System.out.println("start to check type");
		}
		if(checking) {
			List<Activity> listToRemove = new ArrayList<Activity>();
			for(Activity a:finalList) {
				String checkType = a.getType();
				System.out.println("this activity is: "+checkType);
				if(!obj.contains(checkType)) {
					listToRemove.add(a);
					System.out.println(checkType+" is not wanted");
				}
			}
			finalList.removeAll(listToRemove);
		}
//			for(int i=0;i<4;i++) {
//				Object deleteType = obj.get(i);//bar
//				obj.contains("");
//				//["bar", "shop", "show", "checked"]
//				if(!checkType.equals(deleteType.toString())) {
//					finalList.remove(a);
//				}
//			}
		
		System.out.println("there are: "+finalList.size()+" activities are included after type check");
		
//		for(int i=0;i<4;i++) {
//			Object deleteType = obj.get(i);
//			if(!deleteType.toString().equals("checked")) {
//				System.out.println("object["+i+"] is wanted");
//			}else {
//				for(Activity a:finalList) {
//					String checkType = a.getType();
//					if(checkType.equals(deleteType.toString())) {
//						finalList.remove(a);
//					}
//				}
//				System.out.println(deleteType+" is deleted");
//			}
//		}
//		System.out.println("type with qualify result: "+finalList);
//		List<Activity> checkList = new ArrayList<Activity>();
//		List<Activity> temp;
//		for(int i=0;i<4;i++) {
//			Object x = obj.get(i);
//			if(x.toString().equals("null")) {
//				System.out.println("object["+i+"] is null");
//			}else {
//				temp = aSer.queryJoker("type","'"+x.toString()+"'");
//				checkList.addAll(temp);
//			}
//		}
//		System.out.println("type with qualify result: "+checkList);
		//狀態類
		if(obj.get(6).toString().equals("ready")) {
			List<Activity> listToRemove = new ArrayList<Activity>();
			for(Activity a:finalList) {
				if(a.getActualNum()<a.getTargetNum()) {
					listToRemove.add(a);
				}
			}
			finalList.removeAll(listToRemove);
			System.out.println("there are: "+finalList.size()+" activities are included after ready check");
		}
		if(obj.get(7).toString().equals("available")) {
			List<Activity> listToRemove = new ArrayList<Activity>();
			for(Activity a:finalList) {
				if(a.getActualNum()>=a.getLimitNum()) {
					listToRemove.add(a);
				}
			}
			finalList.removeAll(listToRemove);	
			System.out.println("there are: "+finalList.size()+" activities are included after available check");
		}
		
//		for(int i=4;i<6;i++) {
//			Object deleteStatus = obj.get(i);
//			//ready有勾才檢查
//			if(deleteStatus.toString().equals("ready")) {
//				for(Activity a:finalList) {
//					if(a.getActualNum()<a.getTargetNum()) {
//						finalList.remove(a);
//					}
//				}
//			}else if(deleteStatus.toString().equals("available")){
//				for(Activity a:finalList) {
//					if(a.getActualNum()>=a.getLimitNum()) {
//						finalList.remove(a);
//					}
//				}
//			}
//			System.out.println(deleteStatus.toString()+" is checked");
//		}
		
		//日期類
		if(!obj.get(8).toString().equals("null")) {
			List<Activity> listToRemove = new ArrayList<Activity>();
			Date immediatlyD = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			Date beginD = sdf.parse(obj.get(8).toString());
			Date endD = sdf.parse(obj.get(9).toString());
			//進行轉換
//			long period = (endD.getTime()-beginD.getTime())/1000/60;
//			System.out.println("time diff between now & begin: "+period+"min");
			
			for(Activity a:finalList) {
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
				if(yLength-xLength<=0) {
					System.out.println("this activity is not qualify with selected time period");
					listToRemove.add(a);
				}
			}
			finalList.removeAll(listToRemove);
		}else {
			System.out.println("time is not selected");
		}
			System.out.println("final result: "+finalList);
//		activity = aSer.queryJoker("userId",userId,"status","O");
//		if(obj.get(6).toString().equals("null")) {
//			return checkList;
//		}else {
//			return activity;
//		}
		return finalList;
	}
	
	
	
	
	@RequestMapping(path = "ActivityUserId/{userId}",method = RequestMethod.GET)
	public @ResponseBody List<Activity> ActivityUserId(@PathVariable Integer userId,Model m,
			HttpServletRequest request, HttpServletResponse response) throws ParseException {
		System.out.println("start to query");
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

	@RequestMapping(path = "logistic/OrderSearch/{status}",method = RequestMethod.GET)
	public @ResponseBody List<Activity> searchOrder(@PathVariable Integer status,HttpServletRequest request, HttpServletResponse response, Model m
			) throws IOException, ParseException {
//		List<Logistic> newOrder = lSer.queryByStatus(status);
		List<Logistic> newOrder = lSer.queryJoker("ostatus", status);
		lSer.checkReserveTime(newOrder);
		
		System.out.println("order numbers: "+newOrder.size());
		HashMap<Integer,Integer> orderByBar = new HashMap<>();
		List<Activity> activity = new ArrayList<Activity>();
		List<Activity> temp;
		for(Logistic a:newOrder) {
			if(a.getsID()==null) {
				Integer cID = a.getcID();
				orderByBar.putIfAbsent(cID,0);
				orderByBar.put(cID,orderByBar.get(cID)+1);
			}
		}
		System.out.println("hashMap is: "+orderByBar);
		Iterator<Map.Entry<Integer, Integer>> iterator = orderByBar.entrySet().iterator();
		while (iterator.hasNext()) {
			Entry<Integer, Integer> entry = iterator.next();
			Integer barId = entry.getKey();
			Integer orderNum = entry.getValue();
			System.out.println("start query with userId=: "+barId+" &set num=:"+orderNum);
			temp = aSer.queryJoker("userId", barId, "type","'bar'");
			for(Activity bar:temp) {
				bar.setOrderNum(orderNum);
			}
			activity.addAll(temp);
		}
		m.addAttribute("activity",activity);
		return activity;
	}
	
	@RequestMapping(path = "logistic/OrderSearchByBar/{cID}",method = RequestMethod.GET)
	public @ResponseBody List<Logistic> searchOrderByBar(@PathVariable Integer cID,HttpServletRequest request, HttpServletResponse response, Model m
			) throws IOException, ParseException {
		List<Logistic> orderList;
		if(cID==0) {
			orderList = lSer.queryJoker("ostatus","'1'","sID","NULL");
		}else {
			orderList = lSer.queryJoker("cID","'"+cID+"'","ostatus","'1'","sID","NULL");
//			orderList = lSer.queryJoker("cID","'"+cID+"'","ostatus","'1'");
		}
		
		lSer.checkReserveTime(orderList);
		m.addAttribute("activity",orderList);
		return orderList;
	}
	
	@RequestMapping(path = "logistic/LogisticCheck/{oID}",method = RequestMethod.GET)
	public @ResponseBody Logistic LogisticCheck(@PathVariable(value = "oID") String oID) {
		String Param = "oID";
		Logistic logis = lSer.uniqueQuery(Param,oID);
		lSer.checkReserveTime(logis);
		return logis;
	}
	
	@RequestMapping(path = "LogisticCheck/{oID}",method = RequestMethod.GET)
	public @ResponseBody Logistic uniqueQuery(@PathVariable(value = "oID") String oID) {
		String Param = "oID";
		return lSer.uniqueQuery(Param,oID);
	}
	
	@RequestMapping(path = "/logistic/OrderReserveByBar/{situation}/{second}/{oID}/{sID}",method = RequestMethod.GET)
	public @ResponseBody Logistic orderReserve(@PathVariable(value = "oID")String oID,Model m,
			@PathVariable(value = "sID")Integer sID,
			@PathVariable(value = "second")Integer second,
			@PathVariable(value = "situation")String situation,
			HttpServletRequest request, HttpServletResponse response,RedirectAttributes redirectAttrs) throws IOException {
		Logistic rs = lSer.uniqueQuery("oID", "'"+oID+"'");
		Date current = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String reserve = sdFormat.format(current);
		Calendar beforeTime = Calendar.getInstance();
		beforeTime.add(Calendar.SECOND, +second);
		Date beforeD = beforeTime.getTime();
		String after5 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(beforeD);
		System.out.println("current is: "+reserve);
		System.out.println("after 5 is: "+after5);
		//只保留到下一頁
		rs.setsID(sID);
		rs.setoTimeR(after5);
		Integer cID = rs.getcID();
		System.out.println("order reserver success");
		if(situation.equals("bar")) {
			System.out.println("order reserver from bar");
//			return "redirect:/logistic/OrderSearchByBar/"+cID;
		}else if(situation.equals("all")) {
			System.out.println("order reserver from all");
//			return "redirect:/logistic/OrderSearchByBar/0";
		}
		return rs;
	}
}
