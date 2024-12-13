import java.util.Arrays;
import java.util.stream.Stream;

public class Easy_88_MergeSortedArray {

    /**
     * You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n,
     * representing the number of elements in nums1 and nums2 respectively.
     *
     * Merge nums1 and nums2 into a single array sorted in non-decreasing order.
     *
     * The final sorted array should not be returned by the function, but instead be stored inside the array nums1.
     * To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged,
     * and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
     *
     * Example 1:
     *
     * Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     * Output: [1,2,2,3,5,6]
     * Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
     * The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
     *
     * Example 2:
     * Input: nums1 = [1], m = 1, nums2 = [], n = 0
     * Output: [1]
     * Explanation: The arrays we are merging are [1] and [].
     * The result of the merge is [1].
     *
     * Example 3:
     *
     * Input: nums1 = [0], m = 0, nums2 = [1], n = 1
     * Output: [1]
     * Explanation: The arrays we are merging are [] and [1].
     * The result of the merge is [1].
     * Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
     *
     * Constraints:
     *
     * nums1.length == m + n
     * nums2.length == n
     * 0 <= m, n <= 200
     * 1 <= m + n <= 200
     * -109 <= nums1[i], nums2[j] <= 109
     *
     * Solution Explanation = https://medium.com/@robertsevan/leetcode-problem-88-merge-sorted-array-leetcode-top-interview-150-be8416bb1242
     */
    public static void main(String[] args){
        int[] nums1 = {-100, 1, 2, 3, 0, 0, 0};
        int[] nums2 = {2, 5, 6};

        int m = Arrays.stream(nums1).filter(x -> x != 0).toArray().length; // filter the non-zeros from nums1 to get the number of elements we want to use
        int n = nums2.length;

        merge(nums1, m, nums2, n);
    }


    public static void merge(int[] nums1, int n1, int[] nums2, int n2) {
        int i = n1 - 1; // Initialized to n1 - 1, pointing to the last element in the valid portion of nums1
        int j = n2 - 1; // Initialized to n2 - 1, pointing to the last element in nums2
        int k =  n1 + n2 - 1; // Initialized to n1 + n2 - 1, pointing to the last available position in nums1 where elements can be merged


        /*
            The code enters a while loop, which continues as long as both i and j are greater than or equal to 0.
            This loop is used to merge elements from the end of both arrays into nums1
         */
        while(i >= 0 && j >= 0) {
            /*
                If nums1[i] is greater than nums2[j], it means that the current element from nums1 is larger,
                so it is placed in the last available position (nums1[k]) and both i and k are decremented
             */
            if(nums1[i] > nums2[j]){
                nums1[k--] = nums1[i--];
            }
            /*
                If nums2[j] is greater than or equal to nums1[i], it means that the current element from nums2 is larger or equal,
                so it is placed in the last available position (nums1[k]) and both j and k are decremented.
             */
            else{
                nums1[k--] = nums2[j--];
            }
        }

        /*
            If there are remaining elements in nums2 (i.e., j is still greater than or equal to 0), a second while loop is used to copy
            the remaining elements from nums2 into nums1.
            This loop starts at the end of nums2 and fills nums1 from the end, effectively merging the remaining elements
         */
        while(j >= 0){
            nums1[k--] = nums2[j--];
        }


        /**
         * Here is some other code that essentially does the same thing.... I prefer this
          */

        Stream<Integer> a1 = Arrays.stream(nums1).boxed();
        Stream<Integer> a2 = Arrays.stream(nums2).boxed();

        int[] testArray = Stream.concat(a1, a2)
                .mapToInt(Integer::intValue)
                .sorted()
                .filter(x -> x != 0)
                        .toArray();
        // Print it so we can inspect the outcome
        System.out.println(Arrays.toString(nums1));
        System.out.println(Arrays.toString(testArray));

    }


}
