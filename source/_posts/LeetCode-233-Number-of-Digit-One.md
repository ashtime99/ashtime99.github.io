---
title: LeetCode#233. Number of Digit One
categories: ['LeetCode']
tags: ['数学']
date: 2021-09-01 11:03:59
---
## 233. Number of Digit One

难度：<span class="level-hard">困难</span>
来源：[LeetCode](https://leetcode-cn.com/problems/number-of-digit-one/)

Given an integer `n`, count the total number of digit 1 appearing in all non-negative integers less than or equal to `n`.
<!--more-->
**Example 1:**
<pre>
Input: n = 13
Output: 6
</pre>

**Example 2:**
<pre>
Input: n = 0
Output: 0
</pre> 

**Constraints:**

- `0 <= n <= 109`

------
**找规律**
参考官方
假设n=1234567
我们以每一位会出现多少 `1`，用百位来做栗子，前后可分为1234、567
`1234` 比百位大，都会出现100次 `1`，因为 1234`1`00 ~ 1234`1`99 ，注意是**百位出现1的次数**
所以会有1234\*100次1相当于
$$
\frac{n}{1000}*100
$$
接下来考虑567，567是 `n mod 1000` 得到
这里分三种情况 `n mod 1000` 的值我们定义为 $n'$
$$
\begin{cases}
0& {n'<100}\\
n'-100+1& {100 \leq n'<200}\\
100& { n'\geq 200}
\end{cases}
$$

- 小于100，百位为0不存在为1的情况
- 大于等于100，小于200则次数在 [1、100] 之间，比如159，**百位**会有60次出现 `1 `
- 大于等于200，就是100次百位出现 `1`

综上所述，百位的计算公式为：
$$
\frac{n}{1000}*100+min(max(n\ mod\ 1000-100+1,0),100)
$$
通用公式,k代表位数$(k=1,2,3,\cdots)$
$$
\frac{n}{10^{k+1}}*10^{k}+min(max(n\ mod\ 10^{k+1}-10^{k}+1,0),100)
$$
最后求和就可以了。
```java
class Solution {
    public int countDigitOne(int n) {
        long a=1;
        int sum=0;
        while(a<=n){
            sum+=(n/(a*10))*a+Math.min(Math.max(n%(a*10)-a+1,0),a);
            a*=10;
        }
        return sum;
    }
}
```
