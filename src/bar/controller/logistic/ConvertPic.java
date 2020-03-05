package bar.controller.logistic;

import java.io.IOException;

import net.coobird.thumbnailator.Thumbnails;

public class ConvertPic {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String test = "C:\\share\\datasource\\TeamProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Bartenders\\WEB-INF\\resource\\images\\";
		String[] x = test.split("resource");
		System.out.println(x[0]+"resources"+x[1]);
		String path = "C:\\Users\\User\\Downloads\\picture\\";
		String input = "other.png";
		System.out.println("input: "+input);
		String output = path+"convert\\"+input;
		System.out.println("output: "+output);
		try {
			Thumbnails.of(path+input).size(140, 140).toFile(output);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
