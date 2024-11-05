import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * Given a time in -hour AM/PM format, convert it to military (24-hour) time.
 * Sample Input: 07:05:45PM
 * Sample Output: 19:05:45
 *
 * Compile:  javac .\Time.java
 * Run: java Time 07:05:45PM
 * Run Option 1: java Time
 *
 * Run Option 2: java Time 07:05:45PM
 */
public class Time {
        /*
         * Complete the 'timeConversion' function below.
         *
         * The function is expected to return a STRING.
         * The function accepts STRING s as parameter.
         */
        public static String timeConversion(String s) {
            DateFormat format12hour = new SimpleDateFormat("hh:mm:ssa", Locale.US);
            DateFormat format24hour = new SimpleDateFormat("HH:mm:ss");
            System.out.println("Time String Passed: '" + s + "'");

            // Write your code here
            Date time = null;
            try {
                time = format12hour.parse(s);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            String convertedTime = format24hour.format(time);
            System.out.println("Converted Time String: '" + convertedTime + "'");
            return convertedTime;

        }

    public static void main(String[] args) throws ParseException {
        String s = "";
        /**
         * Option 1 - declare an array here to be categorised.
         */

        //s = "07:05:45PM";

        /**
         * Option 2 - read in from the cli args
         */
        if(args!=null) {
            s = args[0].trim();

        }

        /**
         * Call the method that converts
         */
        String result = Time.timeConversion(s);

    }

}
