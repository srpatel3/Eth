import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class P4Driver {

	public static void main(String[] args) throws FileNotFoundException {
		File file = new File("/home/shirish/Eth/src/Shell/Data");
		//Inventory[] list = new Inventory[5];
		//int i = 0; // keeps up with Number of Vendors
		//try{
			ArrayList<DatasetInfo> list_datasetInfo = new ArrayList();
			Scanner scanFile = new Scanner(file);
			int flag = 0;
			DatasetInfo temp_datasetInfo = null;
			while(scanFile.hasNextLine()){
				String tokens[];
				String line = scanFile.nextLine();
				if(flag == 0){
					temp_datasetInfo = new DatasetInfo();
					flag =1;
				}
				if(line.contains(":")){
					tokens = line.split(":");
					switch(tokens[0]){
						case "IP": temp_datasetInfo.setIP(tokens[1]);
							break;
						case "Location": temp_datasetInfo.setdatasetLocation(tokens[1]);
							break;
						case "Description" : temp_datasetInfo.setdatasetDescription(tokens[1]);
							break;
						case "URL" : temp_datasetInfo.setURL(tokens[1]);
							break;
						case "Cost": temp_datasetInfo.setdatasetCost(Integer.parseInt(tokens[1]));
							break;
						case "Owner Address" : temp_datasetInfo.setownerAddress(tokens[1]);
							break;
						case "Dataset Feeds" : temp_datasetInfo.setdatasetFeeds(Integer.parseInt(tokens[1]));
							flag = 0;
							list_datasetInfo.add(temp_datasetInfo);
							break;
						default : System.out.println("Wrong Entry");
					}
					
				}
				
				//System.out.println(line);
				

			} // end of while loop
			
			
			Scanner scan = new Scanner(System.in);
			int input=0;
			do{	
				System.out.println("1. Print List of Datasets\n2. Sort by dataset cost\n3. Sort by dataset feeds\n4. Exit");
				System.out.println("Enter Your Choice:");
				input = scan.nextInt();
				switch(input){
				case 1: 
					for(int i=0;i<list_datasetInfo.size();i++){
						list_datasetInfo.get(i).printInfo();
						System.out.println("\n\n");
					}
					break;
				case 2 : sortByCost(list_datasetInfo);
					break;
				case 3 :
					sortByFeeds(list_datasetInfo);
					break;
				
				}
			}while(input!=4);
			//sort(list_datasetInfo);
			//public void InsertionSort() {
				

			//}

			
	}
	
	//will sort datasets by feedbacks
	public static void sortByFeeds(ArrayList<DatasetInfo> list_datasetInfo){
		for (int i = 1; i < list_datasetInfo.size(); i++) {
			DatasetInfo key = list_datasetInfo.get(i);
			int j = i - 1;
			while (j >= 0 && ( list_datasetInfo.get(j).getFeeds() > list_datasetInfo.get(j + 1).getFeeds())) {
				list_datasetInfo.set(j+1, list_datasetInfo.get(j));
				j--;
				list_datasetInfo.set(j+1,key);
		
			}
		}
		for(int i=0;i<list_datasetInfo.size();i++){
			list_datasetInfo.get(i).printInfo();
			System.out.println("\n\n");
		}
	}
	
	//will sort datasets by cost
	public static void sortByCost(ArrayList<DatasetInfo> list_datasetInfo){
		for (int i = 1; i < list_datasetInfo.size(); i++) {
			DatasetInfo key = list_datasetInfo.get(i);
			int j = i - 1;
			while (j >= 0 && ( list_datasetInfo.get(j).getCost() > list_datasetInfo.get(j + 1).getCost())) {
				list_datasetInfo.set(j+1, list_datasetInfo.get(j));
				j--;
				list_datasetInfo.set(j+1,key);
		
			}
		}
		for(int i=0;i<list_datasetInfo.size();i++){
			list_datasetInfo.get(i).printInfo();
			System.out.println("\n\n");
		}
		
	}
}
