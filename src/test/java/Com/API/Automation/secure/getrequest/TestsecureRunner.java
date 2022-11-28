package Com.API.Automation.secure.getrequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestsecureRunner {
	
	@Test   //This is the Package which is defined under KARATE junit in pom.xml
	public Karate runTest()
	{
		return Karate.run("secure.GetRequest","secureGetWithJWTToken").relativeTo(getClass());
	}
}
