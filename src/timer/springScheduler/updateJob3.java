package timer.springScheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

//@EnableAsync
//@Configuration
//@EnableScheduling
public class updateJob3 {
//	private ProductDataService proS;
//	
//	@Autowired
//	public updateJob3(ProductDataService proS) {
//		this.proS=proS;
//	}
//	
//	@Async
//	@Scheduled(fixedDelay = 5000)
//	public void scheduleFixedDelayTask() {
//		System.out.println("Fixed delay task - " + System.currentTimeMillis() / 5000);
//				try {
//					System.out.println("Status checking...");
//					proS.autoUpdateStatus();
//					System.out.println("每5秒顯示一次:Test123.");
//					Thread.sleep(2000);
//				}catch(Exception e) {
//					e.printStackTrace();
//					System.out.println("Error 1");
//				}
//	}
}
