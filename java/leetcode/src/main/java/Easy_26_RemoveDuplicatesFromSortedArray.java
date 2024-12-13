public class Easy_26_RemoveDuplicatesFromSortedArray {

    public static void main(String[] args){
        int[] nums = {-100, 1, 2, 2, 3, 5, 6, 7, 7, 9};

        removeDuplicates(nums);
    }

    /**
     * Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once.
     * The relative order of the elements should be kept the same. Then return the number of unique elements in nums.
     *
     * Consider the number of unique elements of nums to be k, to get accepted, you need to do the following things:
     *
     * Change the array nums such that the first k elements of nums contain the unique elements in the order they were present in nums initially.
     * The remaining elements of nums are not important as well as the size of nums.
     * Return k.
     *
     *
     *
     *
     * Example Walkthrough
     * Let's assume we have the following sorted integer array nums:
     *
     * nums = [1, 1, 2, 2, 3]
     * Our goal is to remove duplicates using the algorithm described.
     *
     * Initial Setup
     * We initialize k to 0. At this point, the array is unchanged.
     *
     * Iteration 1
     * Element at index 0 is 1. Since k is 0, the first element is considered unique by default. We assign nums[k] to 1 and increment k to 1.
     *
     * Updated array state:
     *
     * nums = [1, 1, 2, 2, 3]
     * k = 1
     * Iteration 2
     * Element at index 1 is also 1. This is a duplicate of nums[k - 1]. We do not increment k.
     *
     * Updated array state (no changes, duplicate ignored):
     *
     * nums = [1, 1, 2, 2, 3]
     * k = 1
     * Iteration 3
     * Element at index 2 is 2. Now, nums[k - 1] is 1, so 2 is unique. We assign nums[k] to 2 and increment k to 2.
     *
     * Updated array state:
     *
     * nums = [1, 2, 2, 2, 3]
     * k = 2
     *
     *
     * Iteration 4
     * Element at index 3 is 2. This is a duplicate of nums[k - 1]. Again, k is not incremented.
     *
     * Updated array state (no changes, duplicate ignored):
     *
     * nums = [1, 2, 2, 2, 3]
     * k = 2
     *
     * Iteration 5
     * Element at index 4 is 3. Now, nums[k - 1] is 2, so 3 is unique. We assign nums[k] to 3 and increment k to 3.
     *
     * Updated array state:
     *
     * nums = [1, 2, 3, 2, 3]
     * k = 3
     */
    public static int removeDuplicates(int[] nums) {
        int counter = 0;

        for(int num : nums){
            if(counter == 0 || num > nums[counter - 1]){
                nums[counter++] = num;
            }

        }

        return counter;
    }

}
