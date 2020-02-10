package timer.quartz;

//import org.quartz.JobExecutionContext;
//import org.quartz.JobExecutionException;
//import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;

//@EnableAsync
//@EnableScheduling
public class updateJob2 {//extends QuartzJobBean {
//	@Autowired
//	private ProductDataService proS;
	
//	@Autowired here then program won't do anything.
//	public updateJob2(ProductDataService proS) {
//		this.proS=proS;
//	}
	
//	@Async
//	@Override
//    protected void executeInternal(JobExecutionContext context) throws JobExecutionException {
//				try {
//					System.out.println("Status checking...");
//					System.out.println(proS);
//					proS.autoUpdateStatus();
//					System.out.println("每5秒顯示一次:Test123.");
//					Thread.sleep(2000);
//				}catch(Exception e) {
//					e.printStackTrace();
//					System.out.println("Error 2");
//				}
//	}
}
