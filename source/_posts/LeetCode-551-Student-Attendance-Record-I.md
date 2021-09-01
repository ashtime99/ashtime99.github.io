---
title: LeetCode#551. Student Attendance Record I
categories: ['LeetCode']
tags: ['字符串']
date: 2021-09-01 11:03:59
---
## 551. Student Attendance Record I
难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/student-attendance-record-i/)

You are given a string s representing an attendance record for a student where each character signifies whether the student was absent, late, or present on that day. The record only contains the following three characters:

- `'A'`: Absent.
- `'L'`: Late.
- `'P'`: Present.
The student is eligible for an attendance award if they meet **both** of the following criteria:

- The student was absent (`'A'`) for **strictly** fewer than 2 days **total**.
- The student was **never** late (`'L'`) for 3 or more **consecutive** days.
Return `true` *if the student is eligible for an attendance award, or false otherwise.*
<!--more-->

**Example 1:**
<pre>
Input: s = "PPALLP"
Output: true
Explanation: The student has fewer than 2 absences and was never late 3 or more consecutive days.
</pre>
**Example 2:**
<pre>
Input: s = "PPALLL"
Output: false
Explanation: The student was late 3 consecutive days in the last 3 days, so is not eligible for the award.
</pre>

**Constraints:**

- `1 <= s.length <= 1000`
- `s[i]` is either `'A'`, `'L'`, or `'P'`.

------

```java
class Solution {
    public boolean checkRecord(String s) {
        char[] chars = s.toCharArray();
        int a = 0;
        for (int i = 0; i < chars.length; i++) {
            if (chars[i] == 'A') {
                a++;
            }
            if (a > 1) {
                return false;
            }
            if (i > 0 && chars[i] == 'L' && i < chars.length - 1) {
                if (chars[i - 1] == 'L' && chars[i + 1] == 'L') {
                    return false;
                }
            }
        }
        return true;
    }
}
```

