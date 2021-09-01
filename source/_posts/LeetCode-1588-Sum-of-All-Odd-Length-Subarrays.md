---
title: LeetCode#1588. Sum of All Odd Length Subarrays
categories: ['LeetCode']
tags: ['遍历']
date: 2021-09-01 11:03:59
---
## 1588. Sum of All Odd Length Subarrays
难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/sum-of-all-odd-length-subarrays/)

Given an array of positive integers `arr`, calculate the sum of all possible odd-length subarrays.

A subarray is a contiguous subsequence of the array.

Return *the sum of all odd-length subarrays of* `arr`.
<!--more-->

**Example 1:**
<pre>
Input: arr = [1,4,2,5,3]
Output: 58
Explanation: The odd-length subarrays of arr and their sums are:
[1] = 1
[4] = 4
[2] = 2
[5] = 5
[3] = 3
[1,4,2] = 7
[4,2,5] = 11
[2,5,3] = 10
[1,4,2,5,3] = 15
If we add all these together we get 1 + 4 + 2 + 5 + 3 + 7 + 11 + 10 + 15 = 58
</pre>

**Example 2:**
<pre>
Input: arr = [1,2]
Output: 3
Explanation: There are only 2 subarrays of odd length, [1] and [2]. Their sum is 3.
</pre>

**Example 3:**
<pre>
Input: arr = [10,11,12]
Output: 66
</pre>

**Constraints:**

- `1 <= arr.length <= 100`
- `1 <= arr[i] <= 1000`

------

**暴力🤣**
```java
class Solution {
    public int sumOddLengthSubarrays(int[] arr) {
        int length=arr.length;
        int n=1;
        int sum=0;
        while(n<=length){
            for(int i=0;i<length;i++){
                if(i+n>length){
                    break;
                }else{
                    for(int j=0;j<n;j++){
                        sum+=arr[i+j];
                    }
                }
            }
            n+=2;
        }
        return sum;
    }
}
```