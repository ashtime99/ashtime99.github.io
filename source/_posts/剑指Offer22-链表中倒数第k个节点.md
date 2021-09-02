---
title: 剑指Offer22.链表中倒数第k个节点
categories: ['剑指Offer']
tags: ['链表','双指针']
date: 2021-09-02 10:58:51
---

## 剑指 Offer 22. 链表中倒数第k个节点

难度：<span class="level-eazy">简单</span>
来源：[LeetCode](https://leetcode-cn.com/problems/lian-biao-zhong-dao-shu-di-kge-jie-dian-lcof/)

输入一个链表，输出该链表中倒数第k个节点。为了符合大多数人的习惯，本题从1开始计数，即链表的尾节点是倒数第1个节点。

例如，一个链表有 `6` 个节点，从头节点开始，它们的值依次是 `1、2、3、4、5、6`。这个链表的倒数第 `3` 个节点是值为 `4` 的节点。

<!--more-->

**示例：**
<pre>
给定一个链表: 1->2->3->4->5, 和 k = 2.
返回链表 4->5.
</pre>

------

**双指针**
一前一后，隔k个节点，当后节点到达尾部时，前节点就是结果值。
```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode getKthFromEnd(ListNode head, int k) {
        ListNode l1 = head;
        ListNode l2 = head;
        for (int i = 1; i < k; i++) {
            if (l2.next != null) {
                l2 = l2.next;
            }
        }
        while (l2.next != null) {
            l2 = l2.next;
            l1 = l1.next;
        }
        return l1;
    }
}
```
时间复杂度：$O(n)$
空间复杂度：$O(1)$
