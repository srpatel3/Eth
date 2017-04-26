
public class DatasetInfo {
	private String IP;
	//private String ownerInfo;
	private String ownerAddress;
	private int datasetCost,datasetFeeds;
	private String datasetLocation, datasetDescription, URL;

	//constructors
	public DatasetInfo(){
		this.IP = "";
		this.ownerAddress = "";
		//this.ownerInfo = null;
		this.datasetDescription = "";
		this.datasetLocation = "";
		this.datasetFeeds = 0;
		this.datasetCost = 0;
	}
	
	public DatasetInfo(String IP, String ownerInfo, String ownerAddress, String datasetLocation, String datasetDescription, String URL, int datasetCost, int datasetFeeds){
		this.IP = IP;
		this.ownerAddress = ownerAddress;
		//this.ownerInfo = ownerInfo;
		this.datasetCost = datasetCost;
		this.datasetDescription = datasetDescription;
		this.datasetFeeds = datasetFeeds;
		this.datasetLocation = datasetLocation;
		this.URL = URL;
	}
	
	//setters
	public void setIP(String IP){
		//System.out.println("Inside IP");
		this.IP = IP;
	}
	
	public void setownerAddress(String ownerAddress){
		//System.out.println("Inside setownerAddress");
		this.ownerAddress = ownerAddress;
	}
	
	public void setdatasetDescription(String datasetDescription){
		//System.out.println("Inside Description");
		this.datasetDescription = datasetDescription;
	}
	
	public void setdatasetLocation(String datasetLocation){
		//System.out.println("Inside Location");
		this.datasetLocation = datasetLocation;
	}
	
	public void setURL(String URL){
		//System.out.println("Inside URL");
		this.URL = URL;
	}
	
	public void setdatasetCost(int datasetCost){
		//System.out.println("Inside Cost");
		this.datasetCost = datasetCost;
	}
	
	public void setdatasetFeeds(int datasetFeeds){
		//System.out.println("Inside Feeds");
		this.datasetFeeds = datasetFeeds;
	}
	
	//getters
	
	public int getCost(){
		return this.datasetCost;
	}
	
	public int getFeeds(){
		return this.datasetFeeds;
	}
	public void printInfo(){
		System.out.println(this.IP +"\n"+  this.datasetLocation +"\n"+ this.datasetDescription +"\n"+ this.URL +"\n"+ this.datasetCost +"\n"+ this.ownerAddress +"\n"+this.datasetFeeds);
	}
}
