public class Medium_122_BestTimeToBuyAndSellStockII {
    /**
     * You are given an array prices where prices[i] is the price of a given stock on the ith day.
     *
     * You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.
     *
     * Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.
     *
     * SLN: https://medium.com/theleanprogrammer/best-time-to-buy-and-sell-stock-ii-140d90750ebd
     */
    public static void main(String[] args){
        int[] prices = {7,1,5,3,6,4};
        maxProfit(prices);

    }

    public static int maxProfit(int[] prices) {
        int sum = 0;
        for(int i = 0; i < prices.length - 1; i++)
        {
            if(prices[i + 1] > prices[i])
                sum += prices[i + 1] - prices[i];
        }
        return sum;
    }

}
