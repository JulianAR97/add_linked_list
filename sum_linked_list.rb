# Definition for singly-linked list.
# class ListNode
#     attr_accessor :val, :next
#     def initialize(val = 0, _next = nil)
#         @val = val
#         @next = _next
#     end
# end
# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}

def add_two_numbers(l1, l2)
  # Define our nodes
  n1 = l1
  n2 = l2
  # add1 will carry a 1 if sum (n1.val, n2.val) > 9
  add1 = false
  # Head of our new linked list
  head = n1.val + n2.val
  
  if head > 9
    add1 = true
    # subtract 10 from head because if 19, we want node.val = 9 and carry the 1
    head -= 10 
  end

  # Root is the linked list. Techinally it is just a node, but no node points to class 
  # But it points to a node, which in turn points to another node etc. 
  root = ListNode.new(head)
  # Initialize last at root because we start with one node
  last = root
  n1 = n1.next
  n2 = n2.next

  # Loop while n1, n2 are not nil, or we still have an additional '1'
  # In other words, while we still have values to add
  while !!n1 || !!n2 || add1
    # If we need to add1, we initialize our sum at 1, otherwise 0
    add1 ? sum = 1 : sum = 0
    add1 = false # Reset flag variable because we already accounted for it above

    if !!n1 # Triggered exclusively at some point if l1 > l2
      sum += n1.val
      n1 = n1.next
    end

    if !!n2
      sum += n2.val
      n2 = n2.next
    end

    # Same logic as before loop
    if sum > 9
      sum -= 10
      add1 = true
    end

    # On first iteration of while loop, last is actually root, but now it changes
    # For Example, if we have an array = [1], '1' is both the first and last element
    last.next = ListNode.new(sum)
    last = last.next
  end

  # Return the root, which is described in detail when defined
  root
end

=begin
Steps
1. Precompute head, add1, root, and last
2. Loop until we reach the end of longest list and add1 is false
3. During each iteration, add values and check add1 flag variable
4. Have our current last node point to an node instantiated with our sum
5. Once loop breaks, simply return root node
=end