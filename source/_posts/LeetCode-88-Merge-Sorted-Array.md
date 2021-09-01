---
title: LeetCode#88. Merge Sorted Array
categories: ['LeetCode']
tags: ['排序']
date: 2021-09-01 11:03:59
---
## 88. Merge Sorted Array

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/merge-sorted-array//)

You are given two integer arrays `nums1` and `nums2`, sorted in **non-decreasing order**, and two integers `m` and `n`, representing the number of elements in `nums1` and `nums2` respectively.

**Merge** `nums1` and `nums2` into a single array sorted in **non-decreasing** order.

The final sorted array should not be returned by the function, but instead *be stored inside the array* `nums1`. To accommodate this, `nums1` has a length of `m + n`, where the first `m` elements denote the elements that should be merged, and the last `n` elements are set to `0` and should be ignored. `nums2` has a length of `n`.

<!--more-->

**Example 1:**
 <pre>
Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
Output: [1,2,2,3,5,6]
Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
 </pre>

**Example 2:**
 <pre>
Input: nums1 = [1], m = 1, nums2 = [], n = 0
Output: [1]
Explanation: The arrays we are merging are [1] and [].
The result of the merge is [1].
 </pre>

**Example 3:**
 <pre>
Input: nums1 = [0], m = 0, nums2 = [1], n = 1
Output: [1]
Explanation: The arrays we are merging are [] and [1].
The result of the merge is [1].
Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
 </pre>
 

**Constraints:**
- `nums1.length == m + n`
- `nums2.length == n`
- `0 <= m, n <= 200`
- `1 <= m + n <= 200`
- <code>-10<sup>9</sup> <= nums1[i], nums2[j] <= 10<sup>9</sup></code>

**Follow up:** Can you come up with an algorithm that runs in O(m + n) time?

------

**直接合并，再冒泡排序**
```
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        for (int i = m; i <m+n; i++) {
            nums1[i]=nums2[i-m];
        }
        for (int i = 0; i < m+n-1; i++) {
            for (int j = 0; j < m+n-i-1; j++) {
                if (nums1[j]>nums1[j+1]){
                    int tmp=nums1[j];
                    nums1[j]=nums1[j+1];
                    nums1[j+1]=tmp;
                }
            }
        }
    }
}
```
**官方题解:直接合并，排序**
```
class Solution {
    public void merge(int[] nums1, int m, int[] nums2, int n) {
        for (int i = 0; i != n; ++i) {
            nums1[m + i] = nums2[i];
        }
        Arrays.sort(nums1);
    }
}
```

