package Com.API.Automation;

public class ReadSystemProperty {
	public static void main(String[] args)
	{
		System.out.println("Location " + System.getProperty("location", "Com/API/Automation"));
		System.out.println("Tags " + System.getProperty("tags", "@Confidence"));
		//to pass the value of both this property as VM argument so we need to create run configuration
		
		
	}

}
