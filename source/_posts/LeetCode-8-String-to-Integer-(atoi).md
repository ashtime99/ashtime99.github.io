---
title: LeetCode#8. String to Integer (atoi)
categories: ['LeetCode']
tags: ['字符串']
date: 2021-09-01 11:03:59
---
## 8. String to Integer (atoi)

难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/string-to-integer-atoi/)

Implement the `myAtoi(string s)` function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

<!--more-->

The algorithm for `myAtoi(string s)` is as follows:

1. Read in and ignore any leading whitespace.
2. Check if the next character (if not already at the end of the string) is `'-'` or` '+'`. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
3. Read in next the characters until the next non-digit Character or the end of the input is reached. The rest of the string is ignored.
4. Convert these digits into an integer (i.e. `"123" -> 123`, `"0032" -> 32`). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
5. If the integer is out of the 32-bit signed integer range`[-2^31, 2^31 - 1]`, then clamp the integer so that it remains in the range. Specifically, integers less than `-2^31` should be clamped to `-2^31`, and integers greater than `2^31 - 1` should be clamped to `2^31 - 1`.
6. Return the integer as the final result.

**Note:**

- Only the space character ' ' is considered a whitespace character.
- Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.

**Example 1:**
<pre>
Input: s = "42"
Output: 42
Explanation: The underlined characters are what is read in, the caret is the current reader position.
Step 1: "42" (no characters read because there is no leading whitespace)
         ^
Step 2: "42" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "42" ("42" is read in)
           ^
The parsed integer is 42.
Since 42 is in the range [-231, 231 - 1], the final result is 42.
</pre>

**Example 2:**
<pre>
Input: s = "   -42"
Output: -42
Explanation:
Step 1: "   -42" (leading whitespace is read and ignored)
            ^
Step 2: "   -42" ('-' is read, so the result should be negative)
             ^
Step 3: "   -42" ("42" is read in)
               ^
The parsed integer is -42.
Since -42 is in the range [-231, 231 - 1], the final result is -42.
</pre>

**Example 3:**
<pre>
Input: s = "4193 with words"
Output: 4193
Explanation:
Step 1: "4193 with words" (no characters read because there is no leading whitespace)
         ^
Step 2: "4193 with words" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "4193 with words" ("4193" is read in; reading stops because the next character is a non-digit)
             ^
The parsed integer is 4193.
Since 4193 is in the range [-231, 231 - 1], the final result is 4193.
</pre>

**Example 4:**
<pre>
Input: s = "words and 987"
Output: 0
Explanation:
Step 1: "words and 987" (no characters read because there is no leading whitespace)
         ^
Step 2: "words and 987" (no characters read because there is neither a '-' nor '+')
         ^
Step 3: "words and 987" (reading stops immediately because there is a non-digit 'w')
         ^
The parsed integer is 0 because no digits were read.
Since 0 is in the range [-231, 231 - 1], the final result is 0.
</pre>

**Example 5:**
<pre>
Input: s = "-91283472332"
Output: -2147483648
Explanation:
Step 1: "-91283472332" (no characters read because there is no leading whitespace)
         ^
Step 2: "-91283472332" ('-' is read, so the result should be negative)
          ^
Step 3: "-91283472332" ("91283472332" is read in)
                     ^
The parsed integer is -91283472332.
Since -91283472332 is less than the lower bound of the range [-231, 231 - 1], the final result is clamped to -231 = -2147483648.
</pre>

**Constraints:**
- `0 <= s.length <= 200`
- s consists of English letters (lower-case and upper-case), digits` (0-9)`, `' '`, `'+'`, `'-'`, and `'.'`.

------
**玄学**
我也很无奈呀w(ﾟДﾟ)w

```java
class Solution {
    public int myAtoi(String s) {
        Boolean flag = true;
        int num = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == 32) {// 判断空格
                if (i >= 1) {
                    if (s.charAt(i - 1) != 32) {
                        break;
                    }
                }
                if (num != 0) {
                    return num;
                } else {
                    continue;
                }
            } else if (s.charAt(i) >= 48 && s.charAt(i) <= 57) {// 数字
                int digit=s.charAt(i) - 48;
                if (i != 0) {
                    if (num > (Integer.MAX_VALUE - digit) / 10) {
                        return flag ? Integer.MAX_VALUE:Integer.MIN_VALUE;
                    }
                    num *= 10;
                }
                num += digit;
            } else if (s.charAt(i) == 45 || s.charAt(i) == 43) {// 正负号
                if (i >= 1) {
                    if (s.charAt(i - 1) != 32) {
                        break;
                    }
                    if (s.charAt(i - 1) == 45 || s.charAt(i - 1) == 43) return 0;
                }
                if (num != 0) {
                    break;
                }
                if (s.charAt(i) == 45) {
                    flag = false;
                }
            } else {
                break;
            }

        }
        return flag ? num : -num;
    }
}
```
时间复杂度：$O(n)$
空间复杂度：$O(1)$
