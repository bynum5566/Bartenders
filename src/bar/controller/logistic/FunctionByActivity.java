package bar.controller.logistic;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bar.controller.WebSocketTest;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Users;
import bar.model.UsersDAO;
import bar.model.logistic.Activity;
import bar.model.logistic.ActivityDAO;
import bar.model.logistic.ActivityService;
import bar.model.logistic.LogisticService;
import bar.model.logistic.Participant;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@SessionAttributes(names= {"activity","participant" , "userName", "CName"})
public class FunctionByActivity {

	private ActivityDAO aDao;
	private ActivityService aSer;
	private LogisticService lSer;
	private UsersDAO uDao;
	private CompanyService cSer;
	
	public FunctionByActivity(ActivityDAO aDao,ActivityService aSer,LogisticService lSer,UsersDAO uDao,CompanyService cSer) {

		this.aDao=aDao;
		this.aSer=aSer;
		this.lSer=lSer;
		this.uDao=uDao;
		this.cSer=cSer;
	}
	
	@RequestMapping(path = "ActivityJoker.do",method = RequestMethod.GET)
	public String ActivityJoker(Model m,HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "Object")List obj
			) throws ParseException, IOException {
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
		if(obj.contains("bar")||obj.contains("shop")||obj.contains("show")||obj.contains("party")) {
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
		
		System.out.println("there are: "+finalList.size()+" activities are included after type check");

		//狀態類
		if(obj.get(4).toString().equals("ready")) {
			List<Activity> listToRemove = new ArrayList<Activity>();
			for(Activity a:finalList) {
				if(a.getActualNum()<a.getTargetNum()) {
					listToRemove.add(a);
				}
			}
			finalList.removeAll(listToRemove);
			System.out.println("there are: "+finalList.size()+" activities are included after ready check");
		}
		if(obj.get(5).toString().equals("available")) {
			List<Activity> listToRemove = new ArrayList<Activity>();
			for(Activity a:finalList) {
				if(a.getActualNum()>=a.getLimitNum()) {
					listToRemove.add(a);
				}
			}
			finalList.removeAll(listToRemove);	
			System.out.println("there are: "+finalList.size()+" activities are included after available check");
		}
		
		//日期類
		if(!obj.get(6).toString().equals("null")) {
			List<Activity> listToRemove = new ArrayList<Activity>();
			Date immediatlyD = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy/MM/dd HH:mm");
			Date beginD = sdf.parse(obj.get(6).toString());
			Date endD = sdf.parse(obj.get(7).toString());
			//進行轉換
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
		m.addAttribute("activity",finalList);
		m.addAttribute("jokerList",obj);
		m.addAttribute("mapOpen","true");
//		response.sendRedirect("/Bartenders/ActivityHall");
//		return null;
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "logistic/ActivityHall";
	}
	
	@RequestMapping(path = "searchMarker.do",method = RequestMethod.POST)
	public String searchMarker(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(name = "type")String type
			) throws IOException, ParseException {
		System.out.println("checkbot contain: "+type);
		String[] x = type.toString().split(",");
		System.out.println("x[0]: "+x[0]);
		System.out.println("x.length: "+x.length);
		List<Activity> activity = null;
		List<Activity> temp;
		
//		List<Activity> activity = aSer.queryJoker("type","'"+x[0]+"'");
//		System.out.println("search result: "+activity);
		for(int i=0;i<x.length;i++) {

			temp = aSer.queryJoker("type","'"+x[i]+"'");
			System.out.println("temp list: "+temp);
			activity.addAll(temp);
			System.out.println("temp activity: "+activity);
		}
//		System.out.println("all list: "+activity);
//		List<Activity> activity = aDao.simpleQuery(hqlStr);
		m.addAttribute("activity",activity);
//		response.sendRedirect("ManageActivity");
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "ManageActivity";
	}
	
	
	
	@RequestMapping(path = "joinActivity.do",method = RequestMethod.POST)
	public String joinActivity(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(name = "userId")Integer userId,
			@RequestParam(name = "activityId")Integer activityId,
			@RequestParam(name = "joinNum")Integer joinNum
			) throws IOException, ParseException, ServletException {

		System.out.println("收到來自Id:"+userId+"對activityId: "+activityId+"報名人數: "+joinNum);
//		aSer.addJoin("activityId",activityId,joinNum);
		
		if(userId.toString().substring(0,1).equals("5")) {
			Company company = cSer.selectCompany(userId);
			System.out.println("company result: "+company);
			aSer.saveParticipant(activityId, userId, company.getCompanyName(), company.getPhone(),joinNum);
		}else if(userId.toString().substring(0,1).equals("1")) {
			Users user = uDao.selectUser(userId);
			System.out.println("user result: "+user);
			aSer.saveParticipant(activityId, userId, user.getUserName(), user.getPhone(),joinNum);
		}

		List<Activity> target = aSer.queryJoker("activityId",activityId);
		for(Activity activity:target) {
			Integer actualNum = activity.getActualNum();
			if(actualNum==null) {
				activity.setActualNum(joinNum);
			}else {
				activity.setActualNum(actualNum+joinNum);
			}
			
		}
		List<Activity> activity = aSer.queryJoker("activityId",activityId);
		System.out.println("try to save: ");

		List<Participant> participant = aSer.queryParticipant(activityId);
		m.addAttribute("activity",activity);
		m.addAttribute("participant",participant);
//		RequestDispatcher rd =request.getRequestDispatcher("ManageActivity");
//		rd.forward(request, response);
//		return null;
		//
//		response.sendRedirect("ActivitySingle");
		response.sendRedirect("queryActivityByActivityId.do?activityId="+activityId);
		return null;
		//
//		return "logistic/ActivitySingle";
	}
	
	////////////////////////////////////////////////////////

	@RequestMapping(path = "saveActivity.do",method = RequestMethod.POST)
	public String createActivity(HttpServletRequest request, HttpServletResponse response,Model m,
			@RequestParam(name = "preUrl")String preUrl,
			@RequestParam(name = "userId")Integer userId,
			@RequestParam(name = "name")String name,
			@RequestParam(name = "address")String address,
			@RequestParam(name = "lat")float lat,
			@RequestParam(name = "lng")float lng,
			@RequestParam(name = "brief")String brief,
			@RequestParam(name = "detail")String detail,
			@RequestParam(name = "realType")String type,
			@RequestParam(name = "beginTime")String beginTime,
			@RequestParam(name = "endTime")String endTime,
			@RequestParam(name = "limitNum")Integer limitNum,
			@RequestParam(name = "targetNum")Integer targetNum,
			@RequestParam(name = "actualNum")Integer actualNum
			) throws IOException, ParseException {
		System.out.println("beginTime: "+beginTime);
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		Map<String, String> temp = new HashMap<String, String>();
		m.addAttribute("temp", temp);
		if (name == null || name.length() == 0) {
			errors.put("name", "尚未輸入活動名稱");
		}

		if (type.equals("no")) {
			errors.put("type", "no");
		}
		
		if (beginTime.length() ==0) {
			errors.put("beginTime", "尚未完整設定時間");
		}
		if (endTime.length() ==0) {
			errors.put("endTime", "尚未完整設定時間");
		}
		
		if (address == null || address.length() == 0) {
			errors.put("address", "尚未輸入活動地點");
		}
		
		if ((lat==0)||(lng==0)) {
			errors.put("map", "尚未點選地圖設定地點");
		}
		
		if (brief == null || brief.length() == 0) {
			errors.put("brief", "尚未輸入簡介");
		}
		
		if (detail == null || detail.length() == 0) {
			errors.put("detail", "尚未輸入內容");
		}
		
		if (userId==null) {
//			errors.put("type", "尚未選擇類型");
			System.out.println("閒置過久，請重新登入");
			
			//for websocket
			WebSocketTest.setModel(m);
			
			return "WelcomeCompany";
		}

		if (errors != null && !errors.isEmpty()) {
			System.out.println("資料不完整");
			temp.put("name", String.valueOf(name));
			temp.put("type", type);
			temp.put("beginTime", beginTime);
			temp.put("endTime", endTime);
			temp.put("address", address);
			temp.put("lat", String.valueOf(lat));
			temp.put("lng", String.valueOf(lng));
			temp.put("limitNum", String.valueOf(limitNum));
			temp.put("targetNum", String.valueOf(targetNum));
			temp.put("actualNum", String.valueOf(actualNum));
			temp.put("brief", brief);
			temp.put("detail", detail);
			
			//for websocket
			WebSocketTest.setModel(m);
			
			return "logistic/ActivityCreate";
		}
		
		System.out.println("this is preUrl: "+preUrl+" ;userId: "+userId);
		String realPath = request.getSession().getServletContext().getRealPath("\\WEB-INF\\resource\\images/");
		System.out.println("this is realPath:"+realPath);
		String tempPath = "C:\\test\\";
		System.out.println("upload file: "+request.getContentLengthLong());
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String filename;
		if(!file.isEmpty()) {
			filename = file.getOriginalFilename();
			InputStream input = file.getInputStream();
		
			System.out.println("start Thumbnails, saving file: "+tempPath+filename);
			File savePath2 = new File(tempPath+filename);
			
			Thumbnails.of(input).size(30, 30).toFile(savePath2);
			System.out.println("Thumbnails complete");
		}else {
			System.out.println("no file selected");
			filename="noImage.png";
		}
		

		Activity activity = new Activity();
		String newBrief = brief.replace("\n", "<br>");
		String newDetail = detail.replace("\n", "<br>");
		aSer.saveActivity(activity,userId, name, address, lat, lng, type, filename, newBrief,newDetail, beginTime, endTime, limitNum, targetNum, actualNum);
		
		System.out.println("try to redirect to ActivityHall");
//		response.sendRedirect("ActivityHall");
//		return "createActivity";
		return "redirect:/queryAllActive.do";
	}
	
	@RequestMapping(path = "updateActivity.do",method = RequestMethod.POST)
	public String updateActivity(HttpServletRequest request, HttpServletResponse response,Model m,
			@RequestParam(name = "preUrl")String preUrl,
			@RequestParam(name = "activityId")Integer activityId,
			@RequestParam(name = "name")String name,
			@RequestParam(name = "address")String address,
			@RequestParam(name = "lat")float lat,
			@RequestParam(name = "lng")float lng,
			@RequestParam(name = "brief")String brief,
			@RequestParam(name = "type")String type,
			@RequestParam(name = "beginTime")String beginTime,
			@RequestParam(name = "endTime")String endTime,
			@RequestParam(name = "limitNum")Integer limitNum,
			@RequestParam(name = "targetNum")Integer targetNum,
			@RequestParam(name = "actualNum")Integer actualNum
////			@RequestParam(name = "img")String img,
		
			) throws IOException, ParseException {
		
		System.out.println("start");
		String realPath = request.getSession().getServletContext().getRealPath("\\WEB-INF\\images\\");
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String filename = null;
		List<Activity> activity = aSer.queryJoker("activityId", activityId);
		
		
		for(Activity a:activity) {
			a.setName(name);
			a.setAddress(address);
			a.setLat(lat);
			a.setLng(lng);
			a.setBrief(brief);
			a.setType(type);
			if(!file.isEmpty()) {
				filename = file.getOriginalFilename();
				InputStream input = file.getInputStream();
				System.out.println("start Thumbnails");
				File savePath2 = new File(realPath+filename);
				System.out.println("this is path:"+realPath);
				Thumbnails.of(input).size(90, 90).toFile(savePath2);
				a.setImg(filename);
			}else {
				System.out.println("file is null");
			};
			a.setBeginTime(beginTime);
			a.setEndTime(endTime);
			a.setLimitNum(limitNum);
			a.setTargetNum(targetNum);
			a.setActualNum(actualNum);
		}
//		//設定日期格式
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
//		System.out.println("Activity time:"+beginTime);
//		//進行轉換
//		Date date1 = sdf.parse(beginTime);
//		System.out.println("開始時間:"+beginTime);
//		Date date2 = sdf.parse(endTime);
//		System.out.println("結束時間:"+endTime);
//		long day=(date2.getTime()-date1.getTime())/(1000*60); 
//		System.out.println("時間差:"+day+"分");
		
//		aDao.saveActivity(activity,userid, name, address, lat, lng, type, filename, text, beginTime, endTime);
//		
//		System.out.println("this is preUrl: "+preUrl);
//		if(preUrl!=null&&preUrl.equals("/createShow")) {
//			System.out.println("try to redirect to ManageBar");
//			response.sendRedirect("ManageBar");
//			return null;
//		}
		System.out.println("try to redirect to ActivityManage");
//		response.sendRedirect("ActivityManage");
//		return "createActivity";
		return "redirect:/queryAllActive.do";
	}
	
	@RequestMapping(path = "queryAllActive.do",method = RequestMethod.GET)
	public String queryAllActive(HttpServletRequest request, HttpServletResponse response, Model m,
			RedirectAttributes redirectAttributes
			) throws IOException, ParseException {

		List<Activity> activity = aSer.queryAll();
		aSer.checkEndTime(activity);
		List<Activity> allActive = aSer.queryJoker("status","'O'");
		m.addAttribute("activity",allActive);
//		redirectAttributes.addFlashAttribute("activitytest", activity);
//		response.sendRedirect("ManageActivity");
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "logistic/ActivityHall";
	}

	@RequestMapping(path = "editActivity.do",method = RequestMethod.GET)
	public String editActivity(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(name = "activityId")Integer activityId
			) throws IOException, ParseException {
		System.out.println("Start query");
		List<Activity> list = aDao.query("activityId",activityId);
		System.out.println("return list: "+list);
		m.addAttribute("activity",list);
//		response.sendRedirect("ManageActivity");
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "logistic/ActivityEdit";
	}
	
	
	@RequestMapping(path = "queryActivityByActivityId.do",method = RequestMethod.GET)
	public String queryActivityByActivityId(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(name = "activityId")Integer activityId,RedirectAttributes redirectAttributes
			) throws IOException, ParseException {
		List<Activity> list = aSer.queryJoker("activityId",activityId);
		List<Participant> participant = aSer.queryParticipant(activityId);
		m.addAttribute("activity",list);
		m.addAttribute("participant",participant);
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "logistic/ActivitySingle";
	}
	
	@RequestMapping(path = "queryActivityByUser.do",method = RequestMethod.GET)
	public String queryActivityByUser(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(name = "currentId")String currentId,RedirectAttributes redirectAttributes
			) throws IOException, ParseException {
		if (currentId==null) {
			System.out.println("閒置過久，請重新登入");
			return "index";
		}
		System.out.println("接收到的id參數為: "+currentId);
		List<Activity> list = aSer.queryJoker("userId",currentId);
		//不檢查 將所有個人活動全部撈出來
//		boolean status = aDao.checkEndTime(list);
//		System.out.println("all activities is checked: "+status);
		m.addAttribute("activity",list);
//		redirectAttributes.addFlashAttribute("activitytest", list);
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "logistic/ActivityManage";
	}
	
	@RequestMapping(path = "return.do",method = RequestMethod.GET)
	public String returnPage(@ModelAttribute("activitytest") List<Activity> activity , Model m) throws IOException, ParseException {
		System.out.println("list contain: "+activity);
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "ActivityHall";
	}
	
	@RequestMapping(path = "closeActivity.do",method = RequestMethod.GET)
	public String closeActivity(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(name = "userId")Integer userId,
			@RequestParam(name = "activityId")Integer activityId
			) throws IOException, ParseException {
		List<Activity> rs = aDao.query("activityId",activityId);
		for(Activity a:rs) {
			if(a.getStatus().equals("O")) {
				a.setStatus("N");
			}
		}
		List<Activity> activity = aDao.query("userId",userId);
		m.addAttribute("activity",activity);
		
		//for websocket
		WebSocketTest.setModel(m);
		
		return "logistic/ActivityManage";
	}
	
	

}
