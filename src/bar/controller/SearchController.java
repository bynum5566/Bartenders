package bar.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bar.model.ProductDataService;

@Controller

@EnableTransactionManagement
public class SearchController {
	@Autowired
	private HttpServletRequest request;
	private ProductDataService pDs;
	
	SearchController(ProductDataService pDs){
		this.pDs = pDs;
	}
	
	/*	SearchController的/search.do	*/	
	@RequestMapping(path = "/search.do", method = RequestMethod.GET)
	public String getSearchResult(
			@RequestParam("keyword") String keyword
			)
	{
		String x = pDs.searchResult(keyword);
		request.setAttribute("(結果頁JSTL)",x);
		return "(結果頁)";
	}
}
