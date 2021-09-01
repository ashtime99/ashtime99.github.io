---
title: LeetCode#12. Integer to Roman
categories: ['LeetCode']
tags: ['字符串']
date: 2021-09-01 11:03:59
---
## 12. Integer to Roman

难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/integer-to-roman/)

Roman numerals are represented by seven different symbols: `I`,`V`, `X`, `L`, `C`, `D` and `M`.
<pre>
<strong>Symbol</strong>       <strong>Value</strong>
I             1
V             5
X             10
L             50
C             100
D             500
M             1000
</pre>
For example, `2` is written as `II` in Roman numeral, just two one's added together. `12` is written as `XII`, which is simply `X + II`. The number `27` is written as `XXVII`, which is `XX + V + II`.
<!--more-->
Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not `IIII`. Instead, the number four is written as `IV`. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as `IX`. There are six instances where subtraction is used:

- `I` can be placed before `V (5)` and `X (10)` to make 4 and 9. 
- `X` can be placed before `L (50)` and `C (100)` to make 40 and 90. 
- `C` can be placed before `D (500)` and `M (1000)` to make 400 and 900.
- Given an integer, convert it to a roman numeral.

**Example 1:**
<pre>
Input: num = 3
Output: "III"
</pre>
**Example 2:**
<pre>
Input: num = 4
Output: "IV"
</pre>
**Example 3:**
<pre>
Input: num = 9
Output: "IX"
</pre>
**Example 4:**
<pre>
Input: num = 58
Output: "LVIII"
Explanation: L = 50, V = 5, III = 3.
</pre>
**Example 5:**
<pre>
Input: num = 1994
Output: "MCMXCIV"
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
</pre>
**Constraints:**

- <code>1 <= num <= 3999</code>
------
```java
class Solution {
    public String intToRoman(int num) {
        int[] values = {1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1};
        String[] symbols = {"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"};
        StringBuffer roman = new StringBuffer();
        for (int i = 0; i < values.length; i++) {
            while (num>=values[i]){
                num=num-values[i];
                roman.append(symbols[i]);
            }
            if (num==0){
                break;
            }
        }
        return roman.toString();
    }
}
```

