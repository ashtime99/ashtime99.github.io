---
title: LeetCode#1. Two Sum
date: 2021-08-20 11:11:52
categories: ['LeetCode']
tags: ['数组','哈希表']
mathjax: true
---

## 1. Two Sum
难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/two-sum)
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
You may assume that each input would have **exactly one solution**, and you may not use the same element twice.
You can return the answer in any order.
<!--more-->
**Example 1:**

<pre>
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Output: Because nums[0] + nums[1] == 9, we return [0, 1].
</pre>

**Example 2:**
<pre>
Input: nums = [3,2,4], target = 6
Output: [1,2]
</pre>
**Example 3:**

<pre>
Input: nums = [3,3], target = 6
Output: [0,1]
</pre>
**Constraints:**

- <code>2 <= nums.length <= 10<sup>4</sup></code>
- <code>-10<sup>9</sup> <= nums[i] <= 10<sup>9</sup></code>
- <code>-10<sup>9</sup> <= target <= 10<sup>9</sup></code>
- Only one valid answer exists.

**Follow-up: Can you come up with an algorithm that is less than $O(n^2)$ time complexity?**

------

**方法一：暴力枚举**

看了一下和官方的暴力枚举一样，就是多了输出的东西，想复杂了。
枚举数组中的每一个数 `x`，寻找数组中是否存在 `target - x`

```java
class Solution {
    public int[] twoSum(int[] nums, int target) {
        List<Integer>out=new ArrayList<>();
        int n=0;
        for (int i=0;i<nums.length;i++){
            int num=nums[i];
            for (int j=i+1;j<nums.length;j++){
                if (num+nums[j]==target){
                    out.add(i);
                    out.add(j);
                }
            }
        }
        int [] array=new int[out.size()];
        for (int i=0;i< out.size();i++){
            array[i]= out.get(i);
        }
        return array;
    }
}
```

官方的暴力解法：

~~~java
class Solution {
    public int[] twoSum(int[] nums, int target) {
        int n = nums.length;
        for (int i = 0; i < n; ++i) {
            for (int j = i + 1; j < n; ++j) {
                if (nums[i] + nums[j] == target) {
                    return new int[]{i, j};
                }
            }
        }
        return new int[0];
    }
}
~~~

**复杂度分析**

- 时间复杂度：$O(N^2)$，其中 $N$ 是数组中的元素数量。最坏情况下数组中任意两个数都要被匹配一次。
- 空间复杂度：$O(1)$。

**方法二：哈希表**

创建一个哈希表，对于每一个 x，我们首先查询哈希表中是否存在 `target - x` ，然后将 `x` 插入到哈希表中，即可保证不会让 x 和自己匹配。

```java
class Solution {
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> hashtable = new HashMap<Integer, Integer>();
        for (int i = 0; i < nums.length; ++i) {
            if (hashtable.containsKey(target - nums[i])) {
                return new int[]{hashtable.get(target - nums[i]), i};
            }
            hashtable.put(nums[i], i);
        }
        return new int[0];
    }
}
```

![p1](4df817f8e8a444ddbed6efed093faa8f.gif)


**复杂度分析**

- 时间复杂度：$O(N)$ ，其中 $N$ 是数组中的元素数量。对于每一个元素 `x`，我们可以 $O(1)$ 地寻找 `target - x`。

- 空间复杂度：$O(N)$ ，其中 $N$ 是数组中的元素数量。主要为哈希表的开销

