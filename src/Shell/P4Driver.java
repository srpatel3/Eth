import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

public class P4Driver {

	public static void main(String[] args) throws FileNotFoundException {
		File file = new File("/home/shirish/Eth/src/Shell/Data");
		//Inventory[] list = new Inventory[5];
		//int i = 0; // keeps up with Number of Vendors
		//try{
			Scanner scanFile = new Scanner(file);
		
			
			while(scanFile.hasNextLine()){
				//int index = 0; // keep up with token
				
				
				String line = scanFile.nextLine();
				System.out.println(line);
				// delimiters
				//String[] tokens = line.split(",");
				
				

			} // end of while loop
			
	}
}
