package timer.test;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

//@Component("quartztask")
public class QuartzTask {
//	@Scheduled
	public void work() {
		System.out.println("每5秒顯示一次,Test123.");
	}
}
