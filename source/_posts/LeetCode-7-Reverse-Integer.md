---
title: LeetCode#7. Reverse Integer
categories: ['LeetCode']
tags: ['遍历']
date: 2021-09-01 11:03:59
---
## 7. Reverse Integer

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/reverse-integer/)

Given a signed 32-bit integer `x`, return `x` with its digits reversed. If reversing `x ` causes the value to go outside the signed 32-bit integer range <code>[-2<sup>31</sup>, 2^<sup>31</sup>-1]</code>, then return 0.

**Assume the environment does not allow you to store 64-bit integers (signed or unsigned).**

<!--more-->

**Example 1:**
<pre>
Input: x = 123
Output: 321
</pre>

**Example 2:**
<pre>
Input: x = -123
Output: -321
</pre>

**Example 3:**
<pre>
Input: x = 120
Output: 21
</pre>

**Example 4:**
<pre>
Input: x = 0
Output: 0
</pre>

**Constraints:**
- <code>-2<sup>31</sup> <= x <= 2<sup>31</sup>-1</code>

------
**遍历取尾数**
```java
/**
*37492/1     37492%10=2
*37492/10    3749%10=9
*37492/100   374%10=4
*37492/1000  37%10=7
*37492/10000 3%10=3
*/
class Solution {
    public int reverse(int x) {
        int r = 0;
        while (x != 0) {
            if (r < Integer.MIN_VALUE / 10 || r > Integer.MAX_VALUE / 10) {
                return 0;
            }
            int n = x % 10;
            x /= 10;
            r = r * 10 + n;
        }
        return r;
    }
}
```
时间复杂度：$O(log|x|)$，翻转的次数即 $x$ 十进制的位数。
空间复杂度：$O(1)$

