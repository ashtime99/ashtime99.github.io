---
title: LeetCode#15. 3Sum
categories: ['LeetCode']
tags: ['排序','双指针']
date: 2021-09-01 11:03:59
---
## 15. 3Sum

难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/3sum/)

Given an integer array nums, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`.

Notice that the solution set must not contain duplicate triplets.

<!--more-->

**Example 1:**
<pre>
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
</pre>
**Example 2:**

<pre>
Input: nums = []
Output: []
</pre>

**Example 3:**
<pre>
Input: nums = [0]
Output: []
 </pre>

**Constraints:**

- <code>0 <= nums.length <= 3000</code>
- <code>-10<sup>5</sup> <= nums[i] <= 10<sup>5</sup></code>

------

**排序+双指针**
```java
class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        int n = nums.length;
        int size = 3;
        //排序
        Arrays.sort(nums);
        List<List<Integer>> ans = new ArrayList<List<Integer>>();
        if (n < size || null == nums) {
            return ans;
        }
        for (int i = 0; i < n; i++) {
            int a = nums[i];
            // 当第一个数大于0时，结果不可能为0，循环结束
            if (a > 0) {
                break;
            }
            // 避免重复
            if (i > 0 && nums[i] == nums[i - 1]) {
                continue;
            }
            int left = i + 1;
            int right = n - 1;
            while (left < right) {
                int sum = a + nums[left] + nums[right];
                if (sum == 0) {
                    ans.add(Arrays.asList(nums[i], nums[left], nums[right]));
                    // 避免重复
                    while (left < right && nums[left] == nums[left + 1]) {
                        ++left;
                    }
                    // 避免重复
                    while (left < right && nums[right] == nums[right - 1]) {
                        --right;
                    }
                    ++left;
                    --right;
                } else {
                    if (sum < 0) {
                        ++left;
                    } else {
                        --right;
                    }
                }
            }
        }
        return ans;
    }
}
```

