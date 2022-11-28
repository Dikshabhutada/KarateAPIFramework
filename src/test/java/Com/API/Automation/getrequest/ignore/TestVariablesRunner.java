package Com.API.Automation.getrequest.ignore;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestVariablesRunner {
	
	@Test   //This is the Package which is defined under KARATE junit in pom.xml
	public Karate runTest()
	{
		return Karate.run("Variables").tags("~@ignore").relativeTo(getClass());
	}
}
