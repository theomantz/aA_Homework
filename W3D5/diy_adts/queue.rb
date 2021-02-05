class Queue

    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue << el
    end

    def dequeue
        dequeue = @queue[0]
        @queue = @queue[1..-1]
        return dequeue
    end

    def peek
        @queue[-1]
    end

end


# Create the queue
queue = Queue.new

10.times { queue.enqueue(rand(12)) }

p queue
# Test Peek
p queue.peek 
p queue
# Test dequeue
p queue.dequeue
p queue
# Second dequeue test
p queue.dequeue
p queue