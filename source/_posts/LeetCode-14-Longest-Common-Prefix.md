---
title: LeetCode#14. Longest Common Prefix
categories: ['LeetCode']
tags: ['纵向扫描']
date: 2021-09-01 11:03:59
---
## 14. Longest Common Prefix

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/longest-common-prefix/)

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string `""`.

<!--more-->

**Example 1:**

<pre>
Input: strs = ["flower","flow","flight"]
Output: "fl"
</pre>

**Example 2:**
<pre>
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
</pre>

**Constraints:**

- <code>1 <= strs.length <= 200</code>
- <code>0 <= strs[i].length <= 200</code>
- <code>strs[i]</code> consists of only lower-case English letters.

------

**纵向扫描**

```java
class Solution {
    public String longestCommonPrefix(String[] strs) {
        if (strs == null || strs.length == 0) return "";
        int length = strs[0].length();
        int count = strs.length;
        for (int i = 0; i < length; i++) {
            char c = strs[0].charAt(i);// 提取一个字符
            for (int j = 1; j < count; j++) {
                if (i == strs[j].length() || c != strs[j].charAt(i)) {// 如果长度超过或者不同字符直接输出
                    return strs[0].substring(0, i);
                }
            }
        }
        return strs[0];
    }
}
```

评论大佬

```java
class Solution {
    public String longestCommonPrefix(String[] strs) {
        if(strs==null||strs.length==0) return "";
        String str=strs[0];
        for(int i=1;i<strs.length;i++){
            while(strs[i].indexOf(str)!=0){
                str=str.substring(0,str.length()-1);
            }
        }
        return str;
    }
}
```

