class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node)
  else
    print "nil\n"
    return
  end
end

def alternate_reverse_list(list) # This one
  previous = nil

  while list
    next_list = list.next_node
    list.next_node = previous
    previous = list
    list = next_list
  end

  previous
end

def detect(list)
  tortoise = list
  hare = list

  while list
    count = 0
    return 'No loop found.' if hare.nil?
    hare = hare.next_node
    return 'No loop found.' if hare.nil?
    hare = hare.next_node
    tortoise = tortoise.next_node
    if hare = tortoise
      tortoise = tortoise.next_node
      count += 1
      while tortoise != hare        
        tortoise = tortoise.next_node
        count += 1
      end
      return "Loop detected: Loop is #{count} steps long"
    end
  end

end

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)

print_values(node3)

puts "----------"

revlist = alternate_reverse_list(node3)

print_values(revlist)

puts "----------"
puts "Making an infinite loop by referencing node3 in node1..."

node1 = LinkedListNode.new(37)
node2 = LinkedListNode.new(99, node1)
node3 = LinkedListNode.new(12, node2)
node1.next_node = node3

puts detect(node3)