class Stack

    def initialize
        @stack = []
    end

    def push(el)
        @stack << el
    end

    def pop
        @stack = @stack[0...-1]
        return @stack[-1]
    end

    def peek
        return @stack[-1]
    end

end


# creating a stack 
stack = Stack.new
p stack
p rand(20).times { stack.push(rand(10) ) }
p stack

# stack.pop
p stack.pop
p stack
p stack.pop
p stack

# stack peek
p stack.peek
p stack