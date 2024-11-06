public class FlippingBits {
    public static void main(String [] args){
        //args setup are "2147483647 1 0"
        for (int i = 0; i < args.length; i++) {

            //System.out.printf("Value %d is %s%n", i, args[i]);
            long input = Long.parseLong(args[i]);
            long result = flippingBits(input);
            System.out.println(result);


        }
    }

    /*
     * Complete the 'flippingBits' function below.
     *
     * The function is expected to return a LONG_INTEGER.
     * The function accepts LONG_INTEGER n as parameter.
     */

    public static long flippingBits(long n) {
        /**
         Flip the bits using XOR with a mask of 32 bits all set to 1
         n ^ 0xFFFFFFFFL flips all bits on the unsigned int.
         0xFFFFFFFFL represents a 32-bit number where all bits are 1 in binary
         Since 0xFFFFFFFFL has all bits set to 1 in its lower 32 bits, XORing n with 0xFFFFFFFFL will flip every bit in n.

         https://medium.com/@Abdulladhif/day-10-solving-the-flipping-bits-challenge-in-java-63cf8ebbf3a2 explanation here
         ----------------------------------------------------------------------------------------------------------------
         XOR explanation
         If the boolean values are the same (true ^ true or false ^ false), the result is false.
         If the boolean values are different (true ^ false or false ^ true), the result is true.
         ----------------------------------------------------------------------------------------------------------------
         Example :
         5 ^ 3 evaluates to 6
         0101 (5 in binary)
         XOR
         0011 (3 in binary)
         = 0110 (6 in binary)
        */

        return n ^ 0xFFFFFFFFL; // XOR with all 1s in 32 bits

    }
}
