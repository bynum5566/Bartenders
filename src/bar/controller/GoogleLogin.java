package bar.controller;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;


@Controller
@SessionAttributes(value = {"LoginStatus" , "email" , "Gname" , "gid" })
public class GoogleLogin {
	

	@RequestMapping(path = "/googleVerify", method = RequestMethod.POST)
	public void verifyToken(String idtokenstr,Model m) throws Exception {
		System.out.println("idtokenstr: "+idtokenstr);
		
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(
				new NetHttpTransport(), JacksonFactory.getDefaultInstance())
				.setAudience(Collections.singletonList("1074410414033-5sfqlbhj6c4tgk8t06164c13kbrh8v88.apps.googleusercontent.com")).build();
		
		GoogleIdToken idToken = null;
		
		try {
			idToken = verifier.verify(idtokenstr);
		} catch (GeneralSecurityException e) {
			System.out.println("驗證時出現GeneralSecurityException異常");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("驗證時出現IOException異常");
			e.printStackTrace();
		}
		
		if (idToken != null) {
			System.out.println("驗證成功.");
			
			Payload payload = idToken.getPayload();
			
			String userId = payload.getSubject();
			System.out.println("User ID: " + userId);
			
			String email = payload.getEmail();
			System.out.println("User email: " + email);
			
			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			System.out.println("emailVerified: " + emailVerified);
			
			String name = (String) payload.get("name");
			System.out.println("User name: " + name);
			
//			String pictureUrl = (String) payload.get("picture");
//			System.out.println("User pictureUrl: " + pictureUrl);
//			String locale = (String) payload.get("locale");
//			System.out.println("User locale: " + locale);
//			String familyName = (String) payload.get("family_name");
//			System.out.println("User familyName: " + familyName);
//			String givenName = (String) payload.get("given_name");
//			System.out.println("User givenName: " + givenName);
			
			m.addAttribute("LoginStatus", "true");
			m.addAttribute("email", email);
			m.addAttribute("Gname", name);
			m.addAttribute("gid", userId);
			
		} else {
			System.out.println("Invalid ID token.");

		}
	}
	
	
	
}
