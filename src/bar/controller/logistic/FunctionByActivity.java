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
import bar.model.logistic.Participant;
import bar.model.logistic.Bar;
import bar.model.logistic.BarDAO;

import net.coobird.thumbnailator.Thumbnails;
import bar.model.Company;
import bar.model.CompanyService;
import bar.model.Users;
import bar.model.UsersDAO;
import bar.model.UsersService;
import bar.model.logistic.Activity;
import bar.model.logistic.ActivityDAO;
import bar.model.logistic.ActivityService;

@Controller
@SessionAttributes(names= {"activity","participant"})
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
			@RequestParam(name = "type")String type,
//			@RequestParam(name = "img")String img,
			@RequestParam(name = "beginTime")String beginTime,
			@RequestParam(name = "endTime")String endTime,
			@RequestParam(name = "limitNum")Integer limitNum,
			@RequestParam(name = "targetNum")Integer targetNum,
			@RequestParam(name = "actualNum")Integer actualNum
			) throws IOException, ParseException {
		System.out.println("type值: "+type);
		Map<String, String> errors = new HashMap<String, String>();
		m.addAttribute("errors", errors);
		
		if (name == null || name.length() == 0) {
			errors.put("name", "請輸入名稱");
		}

		if (address == null || address.length() == 0) {
			errors.put("address", "請輸入地點");
		}
		
		if ((lat==0)||(lng==0)) {
			errors.put("lat", "請點選地圖設定地點");
		}
		
		if (brief == null || brief.length() == 0) {
			errors.put("brief", "請輸入簡介");
		}
		
		if (type.equals("on")) {
			errors.put("type", "尚未選擇類型");
		}
		
		if (userId==null) {
//			errors.put("type", "尚未選擇類型");
			System.out.println("閒置過久，請重新登入");
			return "WelcomeCompany";
		}

		if (errors != null && !errors.isEmpty()) {
			System.out.println("資料不完整");
			return "createShow";
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
			filename="noImage";
		}
		

		Activity activity = new Activity();
		aDao.saveActivity(activity,userId, name, address, lat, lng, type, filename, brief, beginTime, endTime, limitNum, targetNum, actualNum);
		
		
		if(preUrl!=null&&preUrl.equals("/createShow")) {
			System.out.println("try to redirect to ManageBar");
			response.sendRedirect("ManageBar");
			return null;
		}
		System.out.println("try to redirect to createActivity");
		response.sendRedirect("createActivity");
//		return "createActivity";
		return null;
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
		System.out.println("try to redirect to createActivity");
		response.sendRedirect("ActivityHall");
//		return "createActivity";
		return null;
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
		return "logistic/editActivity";
	}
	
	
	@RequestMapping(path = "queryActivityByActivityId.do",method = RequestMethod.GET)
	public String queryActivityByActivityId(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(name = "activityId")Integer activityId,RedirectAttributes redirectAttributes
			) throws IOException, ParseException {
		List<Activity> list = aSer.queryJoker("activityId",activityId);
		List<Participant> participant = aSer.queryParticipant(activityId);
		m.addAttribute("activity",list);
		m.addAttribute("participant",participant);
		return "logistic/ActivitySingle";
	}
	
	@RequestMapping(path = "queryActivityByUser.do",method = RequestMethod.GET)
	public String queryActivityByUser(HttpServletRequest request, HttpServletResponse response, Model m,
			@RequestParam(name = "userId")String userId,RedirectAttributes redirectAttributes
			) throws IOException, ParseException {
		if (userId==null) {
			System.out.println("閒置過久，請重新登入");
			return "index";
		}
		System.out.println("接收到的id參數為: "+userId);
		List<Activity> list = aSer.queryJoker("userId",userId);
		//不檢查 將所有個人活動全部撈出來
//		boolean status = aDao.checkEndTime(list);
//		System.out.println("all activities is checked: "+status);
		m.addAttribute("activity",list);
//		redirectAttributes.addFlashAttribute("activitytest", list);
		return "logistic/ActivityManage";
	}
	
	@RequestMapping(path = "return.do",method = RequestMethod.GET)
	public String returnPage(@ModelAttribute("activitytest") List<Activity> activity) throws IOException, ParseException {
		System.out.println("list contain: "+activity);
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
		return "logistic/ActivityManage";
	}
	
	

}
