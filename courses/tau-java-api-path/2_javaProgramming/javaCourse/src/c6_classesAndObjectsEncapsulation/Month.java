package c6_classesAndObjectsEncapsulation;


/*
    OVERLOADING Methods
    Within a class, you can have multiple methods that have the same name but different signatures. And this is known as overloading.

 */
public class Month {

    public static String getMonth(int month) {
        switch(month) {
            case 1: return "January";
            case 2: return "February";
            case 3: return "March";
            case 4: return "April";
            case 5: return "May";
            case 6: return "June";
            case 7: return "July";
            case 8: return "August";
            case 9: return "September";
            case 10: return "October";
            case 11: return "November";
            case 12: return "December";
            default: return "Invalid month. Please enter a value between 1 and 12.";
        }
    }

    public static int getMonth(String month){
        // "enhanced" switch expression suggested by IDE
        return switch (month.toLowerCase()) {
            case "january" -> 1;
            case "february" -> 2;
            case "march" -> 3;
            case "april" -> 4;
            case "may" -> 5;
            case "june" -> 6;
            case "july" -> 7;
            case "august" -> 8;
            case "september" -> 9;
            case "october" -> 10;
            case "november" -> 11;
            case "december" -> 12;
            default -> -1;
        };
        }
}
