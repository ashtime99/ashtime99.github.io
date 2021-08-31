---
title: LeetCode#1109. Corporate Flight Bookings
categories: ['LeetCode']
tags: []
date: 2021-08-31 15:25:21
---

## 1109. Corporate Flight Bookings

难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/corporate-flight-bookings/)

There are `n` flights that are labeled from `1` to `n`.

You are given an array of flight bookings `bookings`, where <code>bookings[i] = [first<sub>i</sub>, last<sub>i</sub>, seats<sub>i</sub>]</code> represents a booking for flights <code>first<sub>i</sub></code> through <code>last<sub>i</sub></code> (**inclusive**) with seatsi seats reserved for **each flight** in the range.

Return *an array answer of length* `n` *, where* `answer[i]` *is the total number of seats reserved for flight* `i`.

<!--more-->

**Example 1:**
<pre>
Input: bookings = [[1,2,10],[2,3,20],[2,5,25]], n = 5
Output: [10,55,45,25,25]
Explanation:
Flight labels:        1   2   3   4   5
Booking 1 reserved:  10  10
Booking 2 reserved:      20  20
Booking 3 reserved:      25  25  25  25
Total seats:         10  55  45  25  25
Hence, answer = [10,55,45,25,25]
</pre>

**Example 2:**
<pre>
Input: bookings = [[1,2,10],[2,2,15]], n = 2
Output: [10,25]
Explanation:
Flight labels:        1   2
Booking 1 reserved:  10  10
Booking 2 reserved:      15
Total seats:         10  25
Hence, answer = [10,25]
</pre>

**Constraints:**

- <code>1 <= n <= 2 * 10<sup>4</sup></code>
- <code>1 <= bookings.length <= 2 * 10<sup>4</sup></code>
- <code>bookings[i].length == 3</code>
- <code>1 <= first<sub>i</sub> <= last<sub>i</sub> <= n</code>
- <code>1 <= seats<sub>i</sub> <= 104</code>

------

暴力🤣
```java
class Solution {
    public int[] corpFlightBookings(int[][] bookings, int n) {
        int[] ans = new int[n];
        for (int i = 0; i < bookings.length; i++) {
            int a = bookings[i][0] - 1;
            int b = bookings[i][1] - 1;
            for (int j = a; j <= b; j++) {
                ans[j] += bookings[i][2];
            }
        }
        return ans;
    }
}
```

