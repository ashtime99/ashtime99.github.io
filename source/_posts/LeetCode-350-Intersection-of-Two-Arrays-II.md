---
title: LeetCode#350. Intersection of Two Arrays II
categories: ['LeetCode']
tags: ['哈希表']
date: 2021-09-01 11:03:59
---
## 350. Intersection of Two Arrays II
难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/intersection-of-two-arrays-ii/)

Given two integer arrays `nums1` and `nums2`, return *an array of their intersection*. Each element in the result must appear as many times as it shows in both arrays and you may return the result in **any order**.
<!--more-->

**Example 1:**
<pre>
Input: nums1 = [1,2,2,1], nums2 = [2,2]
Output: [2,2]
</pre>

**Example 2:**
<pre>
Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
Output: [4,9]
Explanation: [9,4] is also accepted.
</pre>

**Constraints:**
- `1 <= nums1.length, nums2.length <= 1000`
- `0 <= nums1[i], nums2[i] <= 1000`


**Follow up:**

- What if the given array is already sorted? How would you optimize your algorithm?
- What if `nums1`'s size is small compared to `nums2`'s size? Which algorithm is better?
- What if elements of `nums2` are stored on disk, and the memory is limited such that you cannot load all elements into the memory at once?

------

**哈希表**

```java
class Solution {
    public int[] intersect(int[] nums1, int[] nums2) {
        if (nums1.length > nums2.length) {
            return intersect(nums2, nums1);
        }
        Map<Integer, Integer> hashtable = new HashMap<>();
        for (int num : nums1) {
            int count = hashtable.getOrDefault(num, 0) + 1;
            hashtable.put(num, count);
        }
        int[] ans = new int[nums1.length];
        int index = 0;
        for (int num : nums2) {
            if (hashtable.containsKey(num) && hashtable.get(num) > 0) {
                int count = hashtable.get(num) - 1;
                hashtable.put(num, count);
                ans[index] = num;
                index++;
            } else {
                continue;
            }
        }
        return Arrays.copyOfRange(ans, 0, index);
    }
}
```
时间复杂度：$O(m+n)$
空间复杂度：$O(\min(m,n))$

