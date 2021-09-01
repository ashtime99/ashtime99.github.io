---
title: LeetCode#11. Container With Most Water
categories: ['LeetCode']
tags: ['双指针']
date: 2021-09-01 11:03:59
---

## [11. Container With Most Water](https://leetcode-cn.com/problems/container-with-most-water/)

难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/container-with-most-water/)

Given n non-negative integers <code>a<sub>1</sub>, a<sub>2</sub>, ..., a<sub>n</sub></code>, where each represents a point at coordinate <code>(i, a<sub>i</sub>)</code>. <code>n</code> vertical lines are drawn such that the two endpoints of the line<code> i</code> is at <code>(i, a<sub>i</sub>)</code> and <code>(i, 0)</code>. Find two lines, which, together with the x-axis forms a container, such that the container contains the most water.

**Notice** that you may not slant the container.
<!--more-->

**Example 1:**

![p11](https://img-blog.csdnimg.cn/94527f8bdc1e4a66b4f634a485a1629b.jpg?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAYXNodGltZTk5,size_20,color_FFFFFF,t_70,g_se,x_16#pic_center)

<pre>
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
</pre>

**Example 2:**
<pre>
Input: height = [1,1]
Output: 1
</pre>
**Example 3:**
<pre>
Input: height = [4,3,2,1,4]
Output: 16
</pre>
**Example 4:**
<pre>
Input: height = [1,2,1]
Output: 2
</pre>
**Constraints:**

- <code>n == height.length</code>
- <code>2 <= n <= 10<sup>5</sup></code>
- <code>0 <= height[i] <= 10<sup>4</sup></code>

------
这题一开始想当然的是暴力遍历去取最大值
**暴力遍历**
```java
class Solution {
    public int maxArea(int[] height) {
    int max=0;
         for (int i = 0; i < height.length; i++) {
             for (int j = i+1; j < height.length-1; j++) {
                 int h=height[i]<height[j]?height[i]:height[j];
                 int w=j-i;
                 int area=h*w;
                 max=max>area?max:area;
             }
         }
         return max;
    }
}
```
但是数据量一大就会有问题
官方的思路是双指针
**双指针**
```java
class Solution {
    public int maxArea(int[] height) {
        int max=0;int i=0;int j=height.length-1;
        while (i!=j){
            int area=Math.min(height[i],height[j])*(j-i);
            max=Math.max(max,area);
            if (height[i]>height[j]){
                --j;
            }else{
                ++i;
            }
        }
        return max;
    }
}
```
