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
					+"<tr class=\"pdRow\"><td><button style=\"background-image:url(/Bartenders/images/more_icon.png);background-repeat: no-repeat; background-size: cover; background-position: center;\" onclick=\"location.href = '/Bartenders/DisplayProductList.controller?barAccount="
					+comp.getAccount()
					+"';\" class=\"bT\"/></td><td class=\"MidS1\"><div>"
					+comp.getCompanyName()
					+"</div></td><td class=\"RSide\"><button style=\"background-image:url(/Bartenders/images/delete_icon.png);background-repeat: no-repeat; background-size: cover; background-position: center;\" onclick=\"location.href = '/Bartenders/barDisLike?cidck="
					+comp.getCompanyId()
					+"';\" class=\"bT\"/></td></tr>";
					
//					+"<tr class=\"pdRow\"><td><a class=\"f1\" href=\"/Bartenders/DisplayProductList.controller?barAccount="
//					+comp.getAccount()
//					+"\"><div class=\"bT2\"><input class=\"bT\" type=\"image\" alt=\"button\" src=\"/Bartenders/images/more_icon.png\"></div></a></td><td class=\"MidS1\"><div>"
//					+comp.getCompanyName()
//					+"</div></td><td class=\"RSide\"><a class=\"f1\" href=\"/Bartenders/barDisLike?cidck="
//					+comp.getCompanyId()
//					+"\"><div class=\"bT2\"><input class=\"bT\" type=\"image\" alt=\"button\" src=\"/Bartenders/images/delete_icon.png\"></div></a></td></tr>";

//					+"<tr class=\"pdRow\"><td>"	
//					+"<form action=\"/Bartenders/Product.show\" method=\"GET\">"	
//					+"<input type=\"text\" name=\"CId\" class=\"pdidckLL\" value=\""	
//					+ comp.getCompanyId() + "\" readonly=\"readonly\">" 	
//					+ "<div class=\"pdId\" name=\"pdId1\">編號:</div>"	
//					+"<div><input type=\"submit\" value=\"" + comp.getCompanyId() + "\"/></div></form></td>"	
//					+"<td class=\"MidS1\"><div class=\"pdNm\" name=\"pdNm1\">名稱:</div><div>"	
//					+ comp.getCompanyName() + "</div></td>"	
//					+"<td class=\"RSide\"><form action=\"/Bartenders/pdDisLike\" method=\"POST\">"	
//					+ "<input type=\"text\" name=\"pdidck\" class=\"pdidckLL\" value=\"" + comp.getCompanyId()	
//					+ "\" readonly=\"readonly\"><input type=\"submit\" value=\"刪除\"></form></td>"	
//					+"</tr>";	
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
			disLreLB(userId, companyId);
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
