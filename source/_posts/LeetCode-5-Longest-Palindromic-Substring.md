---
title: LeetCode#5. Longest Palindromic Substring
categories: ['LeetCode']
tags: ['动态规划']
date: 2021-09-01 11:03:59
---
## 5. Longest Palindromic Substring

难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/longest-palindromic-substring/)

Given a string `s`, return *the longest palindromic substring* in `s`.

<!--more-->

**Example 1:**

<pre>
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.
</pre>
**Example 2:**
<pre>
Input: s = "cbbd"
Output: "bb"
</pre>
**Example 3:**
<pre>
Input: s = "a"
Output: "a"
</pre>
**Example 4:**
<pre>
Input: s = "ac"
Output: "a"
 </pre>

**Constraints:**

- `1 <= s.length <= 1000`
- `s` consist of only digits and English letters.


------

**动态规划**

```java
public class Solution {

    public String longestPalindrome(String s) {
        int n = s.length();
        //如果长度为1直接返回
        if (n < 2) {
            return s;
        }
        // 子串最大长度
        int maxLen = 1;
        // 子串起点
        int begin = 0;
        boolean[][] dp = new boolean[n][n];
        // 长度为1的子串都是回文串
        for (int i = 0; i < n; i++) {
            dp[i][i] = true;
        }
        char[] array = s.toCharArray();
        // i代表范围
        for (int i = 2; i <= n; i++) {
            // L代表左边界、R代表右边界
            for (int L = 0; L < n; L++) {
                int R = L + i - 1;
                //右边界超过就退出
                if (R >= n) {
                    break;
                }
                if (array[L] != array[R]) {
                    dp[L][R] = false;
                } else {
                    if (R - L < 3) {
                        dp[L][R] = true;
                    } else {
                        // 左右相等，去找中间的值是否为true
                        dp[L][R] = dp[L + 1][R - 1];
                    }
                }
                // 查找最大长度
                if (dp[L][R] && R - L + 1 > maxLen) {
                    maxLen = R - L + 1;
                    begin = L;
                }
            }
        }
        return s.substring(begin, begin + maxLen);
    }
}
```
时间复杂度：$O(n^2)$
空间复杂度：$O(n^2)$

