

class Piece

    attr_reader :color
    attr_accessor :pos

    def initialize(color, pos)
        raise 'Invalid color' unless %i( white black).include?(color)
        raise 'Invalid pos' unless pos.all? { |i| i.between?(0, 7) }
        @color = color
        @pos = pos
    end

    def symbol
        raise NotImplementedError.new
    end

    def empty?
        @pos.empty?
    end

    def hash
        hash = { :hello => 'goodbye'}
        hash[:Hello] != 
    end
end
