public class Easy_121_BestTimeToBuyAndSellStock {
    /**
     * You are given an array prices where prices[i] is the price of a given stock on the ith day.
     *
     * You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
     *
     * Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
     *
     * SLN: https://evan-soohoo.medium.com/repeat-code-with-leetcode-best-time-to-buy-and-sell-stock-ad8e491b5357
     */
    public static void main(String[] args){
        int[] prices = {7,1,5,3,6,4};
        maxProfit(prices);

    }

    public static int maxProfit(int[] prices) {
        int profit = 0;
        int left = 0;
        int right = 1;
        while (right < prices.length){

            if (prices[right] - prices[left] > 0){
                profit = Math.max(prices[right] - prices[left], profit);
            }else
            {
                left = right;
            }
            right++;

        }
        return profit;
    }

}
