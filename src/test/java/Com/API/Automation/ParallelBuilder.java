package Com.API.Automation;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

public class ParallelBuilder {

	@Test
	public void executeKarateTest()
	{
	   Builder aRunner = new Builder();
	   aRunner.path("classpath:Com/API/Automation");
	   aRunner.parallel(5);
	   
	 //extracting the execucation result from parallel runner
	 		Results result = aRunner.parallel(5);
	 		System.out.println("Total Feature => "+ result.getFeaturesTotal());
	 		System.out.println("Total Scenario => "+ result.getScenariosTotal());
	 		System.out.println("Passed scenario => "+ result.getScenariosPassed());
	 		
	 		Assertions.assertEquals(0, result.getFailCount(),"There are some Failed Scenario");
	 		
	   
	   
	   
	}
}
