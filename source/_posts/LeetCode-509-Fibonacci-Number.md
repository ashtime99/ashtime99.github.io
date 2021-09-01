---
title: LeetCode#509. Fibonacci Number
categories: ['LeetCode']
tags: ['递归']
date: 2021-09-01 11:03:59
---
## 509. Fibonacci Number

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/fibonacci-number/)

The **Fibonacci numbers**, commonly denoted `F(n)` form a sequence, called the **Fibonacci sequence**, such that each number is the sum of the two preceding ones, starting from `0` and `1`. That is,
<pre>
F(0) = 0, F(1) = 1
F(n) = F(n - 1) + F(n - 2), for n > 1.
</pre>
Given `n`, calculate `F(n)`.
<!--more-->
**Example 1:**
<pre>
Input: n = 2
Output: 1
Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
</pre>

**Example 2:**
<pre>
Input: n = 3
Output: 2
Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
</pre>

**Example 3:**
<pre>
Input: n = 4
Output: 3
Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
</pre>

**Constraints:**
- `0 <= n <= 30`

------

**递归**
```java
class Solution {
    public int fib(int n) {
        if (n >= 2) {
            return fib(n - 1) + fib(n - 2);
        }
        if (n == 1) {
            return 1;
        }
        return 0;
    }
}
```

