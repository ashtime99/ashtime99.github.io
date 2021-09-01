---
title: LeetCode#1137. N-th Tribonacci Number
categories: ['LeetCode']
tags: ['动态规划']
date: 2021-09-01 11:03:59
---
## 1137. N-th Tribonacci Number
难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/n-th-tribonacci-number/)

The Tribonacci sequence T<sub>n</sub> is defined as follows: 
T<sub>0</sub> = 0, T<sub>1</sub> = 1, T<sub>2</sub> = 1, and T<sub>n+3</sub> = T<sub>n</sub> + T<sub>n+1</sub> + T<sub>n+2</sub> for n >= 0.
Given n, return the value of T<sub>n</sub>.
<!--more-->
**Example 1:**
<pre>
Input: n = 4
Output: 4
Explanation:
T_3 = 0 + 1 + 1 = 2
T_4 = 1 + 1 + 2 = 4
</pre>

**Example 2:**
<pre>
Input: n = 25
Output: 1389537
 </pre>
**Constraints:**

- `0 <= n <= 37`
- The answer is guaranteed to fit within a 32-bit integer, ie. <code>answer <= 2<sup>31</sup> - 1</code>.

------

**动态规划**

```java
class Solution {
    public int tribonacci(int n) {
        if (n == 0) {
            return 0;
        }
        if (n <= 2) {
            return 1;
        }
        int a = 0, b = 0, c = 1, d = 1;
        for (int i = 3; i <= n; ++i) {
            a = b;
            b = c;
            c = d;
            d = a + b + c;
        }
        return d;
    }
}
```

