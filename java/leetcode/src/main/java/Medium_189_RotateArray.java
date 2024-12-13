import java.util.Arrays;


public class Medium_189_RotateArray {

    /**
     * Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.
     *
     * Example 1:
     *
     * Input: nums = [1,2,3,4,5,6,7], k = 3
     * Output: [5,6,7,1,2,3,4]
     * Explanation:
     * rotate 1 steps to the right: [7,1,2,3,4,5,6]
     * rotate 2 steps to the right: [6,7,1,2,3,4,5]
     * rotate 3 steps to the right: [5,6,7,1,2,3,4]
     *
     */
    public static void main(String[] args){
        int[] nums = {-91, 20, 33, 45, 56};
        int turns = 3;

        rotate(nums, turns);
    }

    public static void rotate(int[] nums, int k) {
        if (nums == null || nums.length == 0) {
            return;
        }
        int[] temp = new int[nums.length];
        for (int i = 0; i < nums.length; i++) {
            temp[(i + k) % nums.length] = nums[i];
        }
        for (int i = 0; i < nums.length; i++) {
            nums[i] = temp[i];
        }
        //System.out.print(Arrays.toString(nums));
    }


}
