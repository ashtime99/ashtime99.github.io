---
title: LeetCode#53. Maximum Subarray
categories: ['LeetCode']
tags: ['动态规划']
date: 2021-09-01 11:03:59
---
## 53. Maximum Subarray

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/maximum-subarray/)

Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return *its sum*.

A **subarray** is a **contiguous** part of an array.

<!--more-->

**Example 1:**
<pre>
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
</pre>
**Example 2:**
<pre>
Input: nums = [1]
Output: 1
</pre>
**Example 3:**
<pre>
Input: nums = [5,4,-1,7,8]
Output: 23
 </pre>

**Constraints:**

- <code>1 <= nums.length <= 3 * 10<sup>4</sup></code>
- <code>-10<sup>5</sup> <= nums[i] <= 10<sup>5</sup></code>

**Follow up:** If you have figured out the O(n) solution, try coding another solution using the **divide and conquer** approach, which is more subtle.

------

**动态规划**

```java
class Solution {
    public int maxSubArray(int[] nums) {
        int sum = 0;
        int max = nums[0];
        for (int n : nums) {
            sum = Math.max(sum + n, n);
            max = Math.max(sum, max);
        }
        return max;
    }
}
```

