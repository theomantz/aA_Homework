class GraphNode

    attr_reader :value
    attr_accessor :neighbors

    def initialize(val)
        @value = val
        @neighbors = []
    end
end

