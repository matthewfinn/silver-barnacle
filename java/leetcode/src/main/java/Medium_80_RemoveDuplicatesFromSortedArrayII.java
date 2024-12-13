public class Medium_80_RemoveDuplicatesFromSortedArrayII{
    /**
     * https://leetcode.com/problems/remove-duplicates-from-sorted-array-ii/?envType=study-plan-v2&envId=top-interview-150
     * Given an integer array nums sorted in non-decreasing order, remove some duplicates in-place such that each unique element appears at most twice.
     * The relative order of the elements should be kept the same.
     *
     * Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums.
     * More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.
     *
     *
     * Return k after placing the final result in the first k slots of nums.
     *
     * SLN: https://algo.monster/liteproblems/80
     */

    public static void main(String[] args){
        int[] nums = {-100, 1, 2, 2, 3, 90, 2, 7, 7};

        removeDuplicates(nums);
    }


    public static int removeDuplicates(int[] nums) {
        int counter = 0;

        for(int num : nums){
            if(counter < 0 || num > nums[counter - 2]){
                nums[counter++] = num;
            }

        }

        return counter;
    }

}
