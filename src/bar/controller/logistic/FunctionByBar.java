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
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bar.model.logistic.Logistic;
import bar.model.logistic.LogisticService;
import bar.model.logistic.Bar;
import bar.model.logistic.BarDAO;
import net.coobird.thumbnailator.Thumbnails;


@Controller

public class FunctionByBar {

	private BarDAO mDao;

	public FunctionByBar(BarDAO mDao) {
		this.mDao=mDao;
	}

	
	@RequestMapping(path = "saveMarker.do",method = RequestMethod.POST)
	public String processAction(@RequestParam(name = "name")String name,
			@RequestParam(name = "address")String address,
			@RequestParam(name = "lat")float lat,
			@RequestParam(name = "lng")float lng,
			@RequestParam(name = "brief")String brief,
			@RequestParam(name = "type")String type,
			@RequestParam(name = "beginTime")String beginTime,
			@RequestParam(name = "endTime")String endTime,
			@RequestParam(name = "uploadFile")MultipartFile srcFile,
			Model m,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		System.out.println("Prepare Marker");
		String realPath = request.getSession().getServletContext().getRealPath("\\WEB-INF\\images\\");
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
		MultipartFile file = multipartRequest.getFile("uploadFile");
		String filename = file.getOriginalFilename();
		InputStream input = file.getInputStream();
		System.out.println("start Thumbnails");
		File savePath2 = new File(realPath+filename);
		System.out.println("this is path:"+realPath);
		Thumbnails.of(input).size(90, 90).toFile(savePath2);
//		Thumbnails.of(input).scale(0.2f).toFile(savePath2);
		
//		try {
//			File savePath = new File("F:/test/"+filename+".png");
//			outputStream = new FileOutputStream(savePath);
//			int read = 0;
//			byte[] bytes = new byte[1024];
//			while ((read = input.read(bytes)) != -1) {
//			    outputStream.write(bytes, 0, read);
//			}
//			System.out.println("File created");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}finally {
//			if(outputStream != null)
//	        {
//	            outputStream.close();
//	        }
//		}

		
		
		Bar marker = mDao.createLocation(name, address, lat, lng, type, filename, brief, beginTime, endTime);
		response.sendRedirect("ManageBar");
		return null;
		
	}
	
	@RequestMapping(path = "Bar/{type}",method = RequestMethod.GET)
	public @ResponseBody List<Bar> processAction(@PathVariable String type,Model m,
			HttpServletRequest request, HttpServletResponse response) {
		System.out.println("start to query");
		List<Bar> list = mDao.query("type",type);

		return list;	
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


}
