---
title: LeetCode#9. Palindrome Number
categories: ['LeetCode']
tags: ['遍历']
date: 2021-09-01 11:03:59
---
## 9. Palindrome Number

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/palindrome-number/)

Given an integer `x`, return `true` if `x` is palindrome integer.

An integer is a **palindrome** when it reads the same backward as forward. For example, `121` is palindrome while `123` is not.
<!--more-->

**Example 1:**
<pre>
Input: x = 121
Output: true
</pre>

**Example 2:**
<pre>
Input: x = -121
Output: false
Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
</pre>

**Example 3:**
<pre>
Input: x = 10
Output: false
Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
</pre>

**Example 4:**
<pre>
Input: x = -101
Output: false
</pre>

**Constraints:**

- <code>-2<sup>31</sup><= x <= 2<sup>31</sup>- 1</code>

------

这题和第7题差不多意思
```java
class Solution {
    public boolean isPalindrome(int x) {
        if (x<0){
            return false;
        }else{
            int n = x;
            int r = 0;
            while (n != 0) {
                if (r < Integer.MIN_VALUE / 10 || r > Integer.MAX_VALUE / 10) {
                    return false;
                }
                r = r * 10 + n % 10;
                n /= 10;
            }
            return r==x;
        }
    }
}
```
时间复杂度：$O(log|x|)$，翻转的次数即 $x$ 十进制的位数。
空间复杂度：$O(1)$