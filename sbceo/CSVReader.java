import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class CSVReader {

    public static void main(String[] args) {

        String csvFile = "SBCEO_Employee.csv";
        BufferedReader br = null;
        String line = "";
        String cvsSplitBy = ",";

        try {

            br = new BufferedReader(new FileReader(csvFile));
            while ((line = br.readLine()) != null) {

                // use comma as separator
                String[] sbceo = line.split(cvsSplitBy);
                int count = 0;
        		for(String s: sbceo) {
        			if(count % 7 == 0){
        				//System.out.print("]");
        				//System.out.println();
        				System.out.println();
        				System.out.print("[");
        			}
        			count++;
        			if(count % 7 == 1){
        				System.out.print("\"" + s + " ");
        			}
        			else if(count % 7 == 2){
        				System.out.print(s + "\"" + ", ");
        			}
        			else if(count % 7 == 3){
        				System.out.print("");
        			}
        			else if(count % 7 == 4){
        				System.out.print("\"" + s + "\"" + ", ");
        			}
        			else if(count % 7 == 5){
        				System.out.print("\"" + s + "\"" + ", ");
        			}
        			else if(count % 7 == 6){
        				if(s.length() == 4){
        					System.out.print("\"8059644710\", " + s + "\"]");
        				}
        				else if(s.length() > 4){
        					System.out.print("\"" + s + "\", \"\"]");
        				}
        				else{
        					System.out.print("\"\", \"\"]");
        				}
        			}	
        			else{
        				count = 0;
        			}
       			}		
				
				
				//System.out.println("" + sbceo[i] + " " sbceo[i+1] + ", " + sbceo[i+2] + ", " + sbceo[i+3] + ", " + sbceo[i+4]);
				
                //System.out.println("Country [code= " + country[4] + " , name=" + country[5] + "]");

            }

        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

}