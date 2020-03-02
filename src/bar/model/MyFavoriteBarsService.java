package bar.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyFavoriteBarsService {
	private MyFavoriteBarsDAO mfbD;
	private CompanyDAO Cdao;
	private MyFavoriteBars mfb;
	
	public MyFavoriteBarsService(){
	}
	
	@Autowired
	public MyFavoriteBarsService(MyFavoriteBarsDAO mfbD, CompanyDAO Cdao, MyFavoriteBars mfb){
		this.mfbD=mfbD;
		this.Cdao=Cdao;
		this.mfb=mfb;
	}
	
	public String showAllFavBars(int userId) {
		List<MyFavoriteBars> MFBs = mfbD.selectFavBars(userId);
		ArrayList<Integer> idList = new ArrayList<Integer>();
		String favbs = "";
		for(MyFavoriteBars MFB : MFBs) {	
			int id = MFB.getCompanyId();	
			System.out.println(id);	
			idList.add(id);	
		}	
		for(int x = 0;x<idList.size();x++) {	
			int companyId = idList.get(x);	
			Company comp = Cdao.selectCompany(companyId);	
			favbs = favbs	
					+"<tr class=\"B1 pdRow\"><td class=\"B1 leftSide\"><div><h3 class=\"nameLink\" onclick=\"location.href='/Bartenders/DisplayProductList.controller?barAccount="
					+ comp.getAccount() + "';\">" +comp.getCompanyName() + "</h3></div></td><td class=\"B1 RSide\">"
					+ "<a href=\"/Bartenders/barDisLike?cidck=" + comp.getCompanyId() + "\" class=\"bT4\">"
					+"<img src=\"/Bartenders/images/delete.png\" style=\"width:40px; height:40px; cursor: pointer;\"/>"
					+ "</a></td></tr>";
		}
		return favbs;
	}
	
	public int getNewFvBId(int userId) {	
		int x = mfbD.selectAllFavBars(userId).size();
		String s1 = Integer.toString(userId); 	
        String s2 = Integer.toString(x); 	
  	
        String s = s1 + s2; 	
  	
        int fNum = Integer.parseInt(s); 	
  	
		return fNum;	
	}
	
	public void addFavBar(int userId, int companyId, int fNum) {
		MyFavoriteBars myFvb = mfbD.selectOneFavBar(userId, companyId);
		if(myFvb == null) {
		String L = "L";
		mfb.setDisliked(L);
		mfb.setfNum(fNum);
		mfb.setCompanyId(companyId);
		mfb.setUserId(userId);
		mfbD.addToFavBar(mfb);
		}else {
			String Like = myFvb.getDisliked();
			if(Like.equals("L")) {
			}else {
				disLreLB(userId, companyId);
			}
		}
	}
	public void disLreLB(int userId, int companyId) {
		MyFavoriteBars myFvb = mfbD.selectOneFavBar(userId, companyId);
		String Like = myFvb.getDisliked();
		if(Like.equals("L")) {
			mfbD.dislikeBar(userId, companyId);
		}else {
			mfbD.likeBar(userId, companyId);
		}
	}
}
