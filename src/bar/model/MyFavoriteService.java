package bar.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyFavoriteService {
	private MyFavoriteDAO mfD;
	private ProductDataDAO pdao;
	private MyFavorite mf;
	
	public MyFavoriteService(){
	}
	
	@Autowired
	public MyFavoriteService(MyFavoriteDAO mfD, ProductDataDAO pdao, MyFavorite mf){
		this.mfD=mfD;
		this.pdao=pdao;
		this.mf=mf;
	}
	
	public String showAllFav(int userId) {
		List<MyFavorite> MFs = mfD.selectFav(userId);
		ArrayList<String> idList = new ArrayList<String>();
		String favs = "";
		for(MyFavorite MF : MFs) {	
			String id = MF.getPdId();	
			System.out.println(id);	
			idList.add(id);	
		}	
		for(int x = 0;x<idList.size();x++) {	
			String pdid = idList.get(x);	
			ProductData prod = pdao.selectP(pdid);	
			favs = favs
					+"<tr class=\"B1 pdRow\"><td class=\"B1 leftSide\"><div><h3 class=\"nameLink\" onclick=\"location.href='/Bartenders/Product.show?PdId="+prod.getPdId()
					+ "';\">" + prod.getProductName() + "</h3></div></td><td class=\"B1 RSide\">"
					+ "<a href=\"/Bartenders/pdDisLike?pdidck=" +prod.getPdId() + "\" class=\"bT4\">"
					+ "<img src=\"/Bartenders/images/delete.png\" style=\"width:40px; height:40px; cursor: pointer;\"/>"
					+ "</a></td></tr>";
		}
		return favs;
	}
	
	public int getNewFvId(int userId) {	
		int x = mfD.selectAllFav(userId).size();
		String s1 = Integer.toString(userId); 	
        String s2 = Integer.toString(x); 	
  	
        String s = s1 + s2; 	
  	
        int fNum = Integer.parseInt(s); 	
  	
		return fNum;	
	}
	
	public void addFav(int userId, String pdId, int fNum) {
		MyFavorite myFv = mfD.selectOneFav(userId, pdId);
		if(myFv == null) {
		String L = "L";
		mf.setDisliked(L);
		mf.setfNum(fNum);
		mf.setPdId(pdId);
		mf.setUserId(userId);
		mfD.addToFav(mf);
		}else {
			String Like = myFv.getDisliked();
			if(Like.equals("L")) {
			}else {
				disLreL(userId, pdId);
			}
		}
	}
	public void disLreL(int userId, String pdId) {
		MyFavorite myFv = mfD.selectOneFav(userId, pdId);
		String Like = myFv.getDisliked();
		if(Like.equals("L")) {
			mfD.dislikePd(userId, pdId);
		}else {
			mfD.likePd(userId, pdId);
		}
	}
}
