import java.net.*;
import java.io.*;

public class Scheduler_now {
 
    public static void main(String[] args) {
        String url = "http://localhost/uniscout/php/email_script.php";
        try {
            URL phpUrl = new URL(url);
            URLConnection urlCon = phpUrl.openConnection();
            BufferedReader br = new BufferedReader(
                                    new InputStreamReader(
                                    urlCon.getInputStream()));
            String line;

            while ((line = br.readLine()) != null) 
                System.out.println(line);
            br.close();
        } catch(Exception e) {
        }
    }
}