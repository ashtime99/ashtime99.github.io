---
title: LeetCode#217. Contains Duplicate
categories: ['LeetCode']
tags: ['哈希表']
date: 2021-09-01 11:03:59
---
## 217. Contains Duplicate

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/contains-duplicate/)

Given an integer array `nums`, return `true` if any value appears **at least twice** in the array, and return `false` if every element is distinct.
<!--more-->
**Example 1:**
<pre>
Input: nums = [1,2,3,1]
Output: true
</pre>
**Example 2:**
<pre>
Input: nums = [1,2,3,4]
Output: false
</pre>
**Example 3:**
<pre>
Input: nums = [1,1,1,3,3,4,3,2,4,2]
Output: true
 </pre>
**Constraints:**

- <code>1 <= nums.length <= 10<sup>5</sup></code>
- <code>-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup></code>

------
**哈希表**
```java
class Solution {
    public boolean containsDuplicate(int[] nums) {
        Map<Integer, Integer> hashtable = new HashMap();
        for (int i = 0; i < nums.length; i++) {
            if (hashtable.containsKey(nums[i])) {
                return true;
            } else {
                hashtable.put(nums[i], 1);
            }
        }
        return false;
    }
}
```

