---
title: LeetCode#2. Add Two Numbers
categories: ['LeetCode']
tags: ['递归','链表']
date: 2021-08-23 15:47:29
---

## 2. Add Two Numbers
难度：<span class="level-md">中等</span>
来源：[LeetCode](https://leetcode-cn.com/problems/add-two-numbers/)

You are given two **non-empty** linked lists representing two non-negative integers. The digits are stored in **reverse order**, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

You may assume the two numbers do not contain any leading zero, except the number 0 itself.
<!--more-->

**Example 1:**

![p2](https://img-blog.csdnimg.cn/c9b78245292c4d13b15f878d424f6794.jpg?x-oss-process=image/watermark,type_ZHJvaWRzYW5zZmFsbGJhY2s,shadow_50,text_Q1NETiBAYXNodGltZTk5,size_15,color_FFFFFF,t_70,g_se,x_16#pic_center)


<pre>
Input: l1 = [2,4,3], l2 = [5,6,4]
Output: [7,0,8]
Explanation: 342 + 465 = 807.
</pre>

**Example 2:**

<pre>
Input: l1 = [0], l2 = [0]
Output: [0]
</pre>

**Example 3:**

<pre>
Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
Output: [8,9,9,9,0,0,0,1]
</pre>

**Constraints:**

- The number of nodes in each linked list is in the range `[1, 100]`.
- `0 <= Node.val <= 9`
- It is guaranteed that the list represents a number that does not have leading zeros.

------

**链表**

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode() {}
 *     ListNode(int val) { this.val = val; }
 *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }
 * }
 */
class Solution {
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode root=null;
        ListNode cursor=null;
        int carry = 0;
        while(l1!=null||l2!=null){
            int n1=(l1!=null?l1.val:0);
            int n2=(l2!=null?l2.val:0);
            int sum=n1+n2+carry;
            carry=sum/10;
            if(root==null){
                root=cursor=new ListNode(sum % 10);
            }else{
                cursor.next=new ListNode(sum % 10);
                cursor=cursor.next;
            }
            if(l1!=null)l1=l1.next;
            if(l2!=null)l2=l2.next;
        }
        if (carry > 0) {
            cursor.next = new ListNode(carry);
        }
        return root;
    }
}
```

时间复杂度：$O(\max(m,n))$，其中 $m$ 和 $n$ 分别为两个链表的长度。我们要遍历两个链表的全部位置，而处理每个位置只需要 $O(1)$ 的时间。

空间复杂度：$O(1)$。注意返回值不计入空间复杂度。
