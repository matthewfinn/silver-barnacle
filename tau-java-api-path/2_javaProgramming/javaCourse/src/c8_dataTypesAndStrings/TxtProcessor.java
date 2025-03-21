package c8_dataTypesAndStrings;

/**
 * A String is an Object that is a sequence of characters
 */
public class TxtProcessor {

    public static void main(String[] args){
        countWords("This is an example for practice");
        reverseString("Testing Reverse");
        addSpaces("Hello,ThisIsANewTest");
    }

    /**
     * Splits a string into an array by tokenising it
     * Counts the works and prints them
     * @param str String to be split
     * @return
     */
    private static void countWords(String str){
        var words = str.split(" ");
        int numWords = words.length;

        String msg = String.format("Your text contains %d words", numWords);
        System.out.println(msg);

        for(String word : words){
            System.out.println(word);
        }
    }

    /**
     * Prints a string in reverse order
     * @param str String to reverse
     */
    private static void reverseString(String str){
        System.out.printf("Reversing String '%s'%n", str);
        for(int i=str.length() - 1; i >=0; i--){
            System.out.print(str.charAt(i));
        }
    }

    /**
     * Add spaces before each uppercase letter
     * @param str jumbled text
     */
    private static void addSpaces(String str){
        var modifiedText = new StringBuilder(str);

        for(int i = 0; i < modifiedText.length(); i++){
            if(i!=0 && Character.isUpperCase(modifiedText.charAt(i))){
                modifiedText.insert(i, " ");
                i++;
            }
        }
        System.out.println(modifiedText);

    }
}
