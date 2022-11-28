package Com.API.Automation.PutRequest;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TesPUTRunner {
	
	@Test   //This is the Package which is defined under KARATE junit in pom.xml
	public Karate runTest()
	{
		return Karate.run("updatejobentry").relativeTo(getClass());
	}
}
