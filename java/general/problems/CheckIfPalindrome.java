public class CheckIfPalindrome{
    public static void main (String[] args){

        String str = "notracecar"; // String for testing
        String str2 = "racecar";
        String str3 = "tattarrattat";
        String str4 = "saippuakivikauppias";
        String str5 = "roTator";

        System.out.println(str + ": "+ isPalindrome(str));
        System.out.println(str2 + ": "+ isPalindrome(str2));
        System.out.println(str3 + ": "+ isPalindrome(str3));
        System.out.println(str4 + ": "+ isPalindrome(str4));
        System.out.println(str5 + ": "+ isPalindrome(str5));

    }

    private boolean isPalindrome(String s){

        String reverse = "";
        for(int i = s.length() - 1; i >= 0; i--){
            reverse += s.charAt(i);
        }

        // check both as lower case
        return reverse.toLowerCase().equals(s.toLowerCase());
    }
}

