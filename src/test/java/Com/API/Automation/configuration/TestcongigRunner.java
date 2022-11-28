package Com.API.Automation.configuration;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestcongigRunner {
	
	@Test   //This is the Package which is defined under KARATE junit in pom.xml
	public Karate runTest()
	{
		return Karate.run("getGlobalConfig","createjobentry").relativeTo(getClass());
	}
}
