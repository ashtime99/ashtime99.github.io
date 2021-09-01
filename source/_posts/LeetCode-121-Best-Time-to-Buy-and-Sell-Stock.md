---
title: LeetCode#121. Best Time to Buy and Sell Stock
categories: ['LeetCode']
tags: ['遍历']
date: 2021-09-01 11:03:59
---
## 121. Best Time to Buy and Sell Stock
难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/)
You are given an array `prices` where `prices[i]` is the price of a given stock on the <code>i<sup>th</sup></code> day.

You want to maximize your profit by choosing a **single day** to buy one stock and choosing a **different day in the future** to sell that stock.

Return *the maximum profit you can achieve from this transaction*. If you cannot achieve any profit, return `0`.
<!--more-->

**Example 1:**
<pre>
Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
</pre>

**Example 2:**
<pre>
Input: prices = [7,6,4,3,1]
Output: 0
Explanation: In this case, no transactions are done and the max profit = 0.
 </pre>

Constraints:

- <code>1 <= prices.length <= 10<sup>5</sup></code>
- <code>0 <= prices[i] <= 10<sup>4</sup></code>

------

**遍历**
```java
class Solution {
    public int maxProfit(int[] prices) {
        int min = prices[0];
        int max = prices[0];
        int sub = 0;
        for (int i = 1; i < prices.length; i++) {
            if (min > prices[i]) {
                min = prices[i];
                max = prices[i];
            }
            if (max < prices[i]) {
                max = prices[i];
            }
            sub = Math.max(sub, max - min);
        }
        return sub;
    }
}
```
时间复杂度：$O(n)$
空间复杂度：$O(1)$

