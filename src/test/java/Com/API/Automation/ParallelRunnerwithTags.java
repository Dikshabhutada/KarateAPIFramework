package Com.API.Automation;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;
import com.intuit.karate.Runner.Builder;

public class ParallelRunnerwithTags {
	
	private static final String CLASS_PATH = "classpath:";
	private static final String DELIMITER = ",";
	
	@Test
	public void executeKarateTests()
	{
		//Runner.parallel(getClass(), 5);
		//you can also specify the builder configuaration inside this method
		Builder aRunner = new Builder();
		   //aRunner.path("classpath:Com/API/Automation/Tag");
		    aRunner.path(getLocation());
		   aRunner.parallel(5);
		   //aRunner.tags("@Confidence");
		   aRunner.tags(getTags());
		   //Runner.parallel(aRunner);
		
	} 
	// Step 1 - provide values for location and tags property. all the values will be separated by ","
	// read the values , split them using the "," and create a list out of it
      /* private List<String> getTags()
       {
    	   String aTags = System.getProperty("tags", "@Confidence");
    	   List<String> aTagList = Arrays.asList(aTags);
    	   return aTagList;
    	   
    	}
       //in case of location we need to prepare the location with the class string so first create private variablefor the string
       private List<String> getLocation()
       {
    	   String aLocation = System.getProperty("location", "Com/API/Automation");
    	   List<String> aLocationList = Arrays.asList(CLASS_PATH + aLocation);
    	   return aLocationList;
    	   
       } */
     //enhancing parallel runner
	 private List<String> getTags()
     {
  	   String aTags = System.getProperty("tags", "@Confidence");
  	   List<String> aTagList = Collections.emptyList();
  	   // first check for the delimiter(,)
  	   //if the aTags has delimiter then split the string using the delimeter
  	   // And create the list out of it
  	   // if aTags does not have delimiter, then use the old logic
  	   if(aTags.contains(DELIMITER))
  	   {
  		   String tagArray[] = aTags.split(DELIMITER);
  		   aTagList = Arrays.asList(tagArray);
  		   return aTagList;
  		   
  	   }
  	   aTagList = Arrays.asList(aTags);
  	   return aTagList;
     }
	 
	 private List<String> getLocation()
     {
  	   String aLocation = System.getProperty("location", "Com/API/Automation");
  	    List<String> aLocationList = Collections.emptyList(); 
  	   if(aLocation.contains(DELIMITER)) {
  		 String locationArray[] = aLocation.split(DELIMITER);
  		aLocationList = Arrays.asList(locationArray);
  		aLocationList.replaceAll((entry) -> {
  			return CLASS_PATH + entry;
  		});
  		return aLocationList;
  	   }
  	 aLocationList = Arrays.asList(aLocation);
	   return aLocationList;
     }
}
