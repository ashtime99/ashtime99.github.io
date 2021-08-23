---
title: LeetCode#3. Longest Substring Without Repeating Characters
categories: []
tags: ['哈希表','字符串','滑动窗口']
date: 2021-08-23 15:49:22
---

## 3. Longest Substring Without Repeating Characters

难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/)

Given a string s, find the length of the **longest substring** without repeating characters.

<!--more-->


**Example 1:**
<pre>
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.
</pre>

**Example 2:**
<pre>
Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.
</pre>

**Example 3:**
<pre>
Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
</pre>

**Example 4:**
<pre>
Input: s = ""
Output: 0
</pre>

**Constraints:**

- <code>0 <= s.length <= 5 * 10<sup>4</sup></code>
- `s` consists of English letters, digits, symbols and spaces.

------

**暴力**

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
        int max = 0;
        Map<Character, Integer> hashtable = new HashMap<Character, Integer>();
        char[] charArray = s.toCharArray();
        for (int i = 0; i < charArray.length; i++) {
            int num = 0;
            for (int j = i; j < charArray.length; j++) {
                if (hashtable.containsKey(charArray[j])) {
                    hashtable.clear();
                    break;
                } else {
                    num += 1;
                    hashtable.put(charArray[j], j);
                }
                if (max < num) max = num;
            }
        }
        return max;
    }
}
```
时间复杂度：$O(N^2)$

空间复杂度：$O(|\Sigma|)$

**官方-滑动窗口**

```java
class Solution {
    public int lengthOfLongestSubstring(String s) {
        // 哈希集合，记录每个字符是否出现过
        Set<Character> occ = new HashSet<Character>();
        int n = s.length();
        // 右指针，初始值为 -1，相当于我们在字符串的左边界的左侧，还没有开始移动
        int rk = -1, ans = 0;
        for (int i = 0; i < n; ++i) {
            if (i != 0) {
                // 左指针向右移动一格，移除一个字符
                occ.remove(s.charAt(i - 1));
            }
            while (rk + 1 < n && !occ.contains(s.charAt(rk + 1))) {
                // 不断地移动右指针
                occ.add(s.charAt(rk + 1));
                ++rk;
            }
            // 第 i 到 rk 个字符是一个极长的无重复字符子串
            ans = Math.max(ans, rk - i + 1);
        }
        return ans;
    }
}
```

时间复杂度：$O(N)$，其中 $N$ 是字符串的长度。左指针和右指针分别会遍历整个字符串一次。

空间复杂度：$O(|\Sigma|)$，其中 $\Sigma$ 表示字符集（即字符串中可以出现的字符），$|\Sigma|$ 表示字符集的大小。在本题中没有明确说明字符。
