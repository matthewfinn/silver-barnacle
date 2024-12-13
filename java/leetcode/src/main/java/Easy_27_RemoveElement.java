
public class Easy_27_RemoveElement {

    /**
     *
     * Given an integer array nums and an integer val, remove all occurrences of val in nums in-place.
     * The order of the elements may be changed. Then return the number of elements in nums which are not equal to val.
     *
     * Consider the number of elements in nums which are not equal to val be k, to get accepted, you need to do the following things:
     *
     * Change the array nums such that the first k elements of nums contain the elements which are not equal to val.
     * The remaining elements of nums are not important as well as the size of nums.
     * Return k.
     *
     *
     * Some explanation from t'internet : https://medium.com/@robertsevan/leetcode-problem-27-remove-element-leetcode-top-interview-150-2ccf28875032#be0b
     */
    public static void main(String[] args){
        int[] nums = {-100, 1, 2, 2, 3, 90, 2, 7};
        int val = 2;

        removeElement(nums, val);
    }

    public static int removeElement(int[] nums, int val) {
        int counter = 0;
        for(int num: nums){
            if(num != val){
                nums[counter] = num;
                counter++;
            }
        }
        return counter;
    }
}
