require 'byebug'
class LRUCache

    attr_accessor :lru_idx, :free_idx, :lru_idx, :reverse
    attr_reader :max_idx

    def initialize(n)
        @store = Array.new(n)
        @reverse = false
        @lru_idx = nil
        @free_idx = 0
        @max_idx = n - 1
    end

    def add(item)
        @store[@free_idx] = item
        if reverse
            update_lru
        end
        update_free
    end
    
    def count
        @store.count { |el| !el.nil?  }
    end
    
    def show
        print @store
    end

    private
    def nil?
        lru_idx.nil?
    end
    
    def switch
        reverse ? reverse = false : reverse = true
    end
    
    
    def self.update_lru
        if nil?
            lru_idx = 0
        else
            lru_idx == max_idx ? lru_idx = 0 : lru_idx += 1
        end
    end

    def update_free
        # debugger
        (@free_idx == max_idx) ? (@free_idx = 0) : (@free_idx += 1)
        if @free_idx == 0 || @free_idx == max_idx
            switch
        end
    end
    
end