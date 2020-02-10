package bar.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MyFavoriteService {
	private MyFavoriteDAO mfD;
	@Autowired
	private ProductDataDAO pdao;
	private MyFavorite mf = new MyFavorite();
	
	public MyFavoriteService(){
	}
	
	@Autowired(required = true)
	public MyFavoriteService(MyFavoriteDAO mfD){
		this.mfD=mfD;
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
					+"<tr class=\"pdRow\"><td>"
					+"<form action=\"/Bartenders/Product.show\" method=\"GET\">"
					+"<input type=\"text\" name=\"pdidck\" class=\"pdidckLL\" value=\""
					+ prod.getPdId() + "\" readonly>" 
					+ "<div class=\"pdId\" name=\"pdId1\">編號:</div>"
					+"<div><input type=\"submit\" value=\"" + prod.getPdId() + "\"/></div></form></td>"
					+"<td class=\"MidS1\"><div class=\"pdNm\" name=\"pdNm1\">名稱:<div/><div>"
					+ prod.getProductName() + "</div></td>"
					+"<td class=\"RSide\"><form action=\"/Bartenders/pdDisLike\" method=\"POST\">"
					+ "<input type=\"text\" name=\"pdidck\" class=\"pdidckLL\" value=\"" + prod.getPdId()
					+ "\" readonly=\"readonly\"><input type=\"submit\" value=\"刪除\"></form></td>"
					+"</tr>";
		}
		return favs;
	}
	
	public void addFav(int userId, String pdId) {
		MyFavorite myFv = mfD.selectOneFav(userId, pdId);
		if(myFv == null) {
		String L = "L";
		mf.setDisliked(L);
		mf.setPdId(pdId);
		mf.setUserId(userId);
		mfD.addToFav(mf);
		}else {
			disLreL(userId, pdId);
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
