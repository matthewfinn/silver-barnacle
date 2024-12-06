package basic;

public class ReverseStringWithRecursion
{
    //recursive function to reverse a string
    public void reverseString(String str)
    {
        if ((str==null)||(str.length() <= 1))
            System.out.println(str);
        else
        {
            System.out.println(str.charAt(str.length()-1));
            // str substring method = 1st index is inclusive, 2nd exclusive
            reverseString(str.substring(0,str.length()-1));
        }
    }

    public static void main(String[] args)
    {
        //string to be reversed
        String str = "The purpose";
        ReverseStringWithRecursion rs = new ReverseStringWithRecursion();
        //invoking the recursive function and passing the string to be reversed
        rs.reverseString(str);
    }
}