package Com.API.Automation;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunner {
	
	@Test
	public void executeKarateTests()
	{
		Runner.parallel(getClass(), 5);
		//you can also specify the builder configuaration inside this method
		 //Builder aRunner = new Builder();
		   //aRunner.path("classpath:Com/API/Automation");
		   //aRunner.parallel(5);
		   //Runner.parallel(aRunner);
	       
		
	}
		}
