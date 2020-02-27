package bar.controller.logistic;

import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class ConvertPic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String path = "C:\\Users\\User\\Downloads\\picture\\";
		String input = "party2.jpg";
		System.out.println("input: "+input);
		String output = path+"convert\\"+input;
		System.out.println("output: "+output);
		try {
			Thumbnails.of(path+input).size(180, 180).toFile(output);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
