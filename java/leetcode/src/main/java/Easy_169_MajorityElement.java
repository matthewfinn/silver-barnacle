import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class Easy_169_MajorityElement {

    /**
     *
     * Given an array nums of size n, return the majority element.
     *
     * The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
     */

    public static void main(String[] args){
        int[] nums = {3,2,3,2,3};

        majorityElement(nums);
    }
    public static int majorityElement(int[] nums) {

        Map<Integer, Integer> frequency = new HashMap<>();

        for (int num : nums){
            int count = frequency.getOrDefault(num, 0);
            frequency.put(num, count + 1);
        }
        return Collections.max(frequency.entrySet(), Map.Entry.comparingByValue()).getKey();
    }
}
