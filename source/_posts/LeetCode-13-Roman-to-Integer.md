---
title: LeetCode#13. Roman to Integer
categories: ['LeetCode']
tags: ['字符串']
date: 2021-09-01 11:03:59
---
## 13. Roman to Integer

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/roman-to-integer/)

Roman numerals are represented by seven different symbols: `I`, `V`, `X`, `L`, `C`, `D` and `M`.
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
For example, `2` is written as `II` in Roman numeral, just two one's added together. `12` is written as `XII`, which is simply `X + II`. The number `27` is written as XXVII, which is `XX + V + II`.
<!--more-->

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not `IIII`. Instead, the number four is written as `IV`. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:

- `I` can be placed before `V (5)` and `X (10)` to make 4 and 9. 
- `X` can be placed before `L (50)` and `C (100)` to make 40 and 90. 
- `C` can be placed before `D (500)` and `M (1000)` to make 400 and 900.

Given a roman numeral, convert it to an integer.

**Example 1:**

<pre>
Input: s = "III"
Output: 3
</pre>
**Example 2:**
<pre>
Input: s = "IV"
Output: 4
</pre>
**Example 3:**
<pre>
Input: s = "IX"
Output: 9
</pre>
**Example 4:**
<pre>
Input: s = "LVIII"
Output: 58
Explanation: L = 50, V= 5, III = 3.
</pre>
**Example 5:**

<pre>
Input: s = "MCMXCIV"
Output: 1994
Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
</pre>

**Constraints:**

- `1 <= s.length <= 15`
- `s` contains only the characters `('I', 'V', 'X', 'L', 'C', 'D', 'M')`.
- It is **guaranteed** that s is a valid roman numeral in the range `[1, 3999]`.

------

```java
class Solution {
    public int romanToInt(String s) {
        Map<String, Integer> map = new HashMap<>();
        map.put("I", 1);
        map.put("IV", 4);
        map.put("V", 5);
        map.put("IX", 9);
        map.put("X", 10);
        map.put("XL", 40);
        map.put("L", 50);
        map.put("XC", 90);
        map.put("C", 100);
        map.put("CD", 400);
        map.put("D", 500);
        map.put("CM", 900);
        map.put("M", 1000);
        int n = 0;
        for (int i = 0; i < s.length(); i++) {
            if (i + 1 < s.length() && map.containsKey(s.substring(i, i + 2))) {
                n += map.get(s.substring(i, i + 2));
                i += 1;
            } else {
                n += map.get(s.substring(i, i + 1));
            }
        }
        return n;
    }
}
```


评论区一位老哥是真的溜
```java
class Solution {
    public int romanToInt(String s) {
        s = s.replace("IV","a");
        s = s.replace("IX","b");
        s = s.replace("XL","c");
        s = s.replace("XC","d");
        s = s.replace("CD","e");
        s = s.replace("CM","f");
        
        int result = 0;
        for (int i=0; i<s.length(); i++) {
            result += which(s.charAt(i));
        }
        return result;
    }

    public int which(char ch) {
        switch(ch) {
            case 'I': return 1;
            case 'V': return 5;
            case 'X': return 10;
            case 'L': return 50;
            case 'C': return 100;
            case 'D': return 500;
            case 'M': return 1000;
            case 'a': return 4;
            case 'b': return 9;
            case 'c': return 40;
            case 'd': return 90;
            case 'e': return 400;
            case 'f': return 900;
        }
        return 0;
    }
}
```

