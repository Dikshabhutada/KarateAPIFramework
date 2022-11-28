package Com.API.Automation;

import java.io.File;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;

public class ParallelBuilderWithCucumberReport {

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
	 		generateCucumberReport(result.getReportDir());
	 		Assertions.assertEquals(0, result.getFailCount(),"There are some Failed Scenario");
	 		
	   }
	// provide the implementation for the report generation and this method takes  the parameter that is the location of thr report directory
	// reportDirLocation --> C:\Users\HP\eclipse-workspace\add\Arrays\assi\karateFramework\target\karate-reports
	private void generateCucumberReport(String reportDirLocation)

	{
		//from file object we can filter only Json file which is present in above location
		File reportDir = new File(reportDirLocation);
		Collection<File> jsonCollection = FileUtils.listFiles(reportDir, new String[] {"karate-json.txt"}, true);
		
		//using this file we will get the absolute path for details on json file
		//create a list which will contain the absolute location of the json file
		List<String> jsonFiles = new ArrayList<String>();
		jsonCollection.forEach(file -> jsonFiles.add(file.getAbsolutePath()));
		
		Configuration configuration = new Configuration(reportDir,"karate Run");
		ReportBuilder reportBuilder = new ReportBuilder(jsonFiles, configuration);
		reportBuilder.generateReports();
		
		
		
	}
}
