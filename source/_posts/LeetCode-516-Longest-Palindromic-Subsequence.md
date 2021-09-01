---
title: LeetCode#516. Longest Palindromic Subsequence
categories: ['LeetCode']
tags: ['动态规划']
date: 2021-08-23 15:47:29
---
## 516. Longest Palindromic Subsequence
难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/longest-palindromic-subsequence/)

Given a string s, find the longest palindromic **subsequence**'s length in `s`.

A **subsequence** is a sequence that can be derived from another sequence by deleting some or no elements without changing the order of the remaining elements.
<!--more-->
**Example 1:**
<pre>
Input: s = "bbbab"
Output: 4
Explanation: One possible longest palindromic subsequence is "bbbb".
</pre>

**Example 2:**
<pre>
Input: s = "cbbd"
Output: 2
Explanation: One possible longest palindromic subsequence is "bb".
</pre>

**Constraints:**

- <code>1 <= s.length <= 1000</code>
- `s` consists only of lowercase English letters.

------
**动态规划**
如果一个回文子序列长度大于2，去除收尾两个字符，它仍然是回文子序列。所以可以使用动态规划。
```java
class Solution {
    public int longestPalindromeSubseq(String s) {
        int n=s.length();
        int [][]dp=new int[n][n];
        for(int i=n-1;i>=0;i--){
            dp[i][i]=1;
            char c1=s.charAt(i);
            for(int j=i+1;j<n;j++){
                char c2=s.charAt(j);
                if(c1==c2){
                    dp[i][j]=dp[i+1][j-1]+2;
                }else{
                    dp[i][j]=Math.max(dp[i][j-1],dp[i+1][j]);
                }
            }
        }
        return dp[0][n-1];
    }
}
```
