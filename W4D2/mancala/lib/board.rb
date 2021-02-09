require 'byebug'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    # debugger
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_index do |i|
      @cups[i] = [:stone, :stone, :stone, :stone] unless (i == 6 || i == 13)
    end
  end

  def valid_move?(start_pos)
    if !start_pos.between?(0, 12)
      raise ArgumentError.new("Invalid starting cup")
    elsif @cups[start_pos].empty?
      raise StandardError.new("Starting cup is empty")
    end
    return true
  end

  def make_move(start_pos, current_player_name)
    if valid_move?(start_pos)
      stones = @cups[start_pos]
      @cups[start_pos] = []
      
      position = start_pos
      # debugger
      until stones.empty?
        position = (position + 1) % cups.count
        if position == 6
          @cups[position] << stones.shift if current_player_name == @name1
        elsif position == 13
          @cups[position] << stones.shift if current_player_name == @name2
        else
          @cups[position] << stones.shift
        end
      end
    end
    render
    next_turn(position)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif @cups[ending_cup_idx].count == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    @cups[0..5].all?(&:empty?) || @cups[7..12].all?(&:empty?)
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 0
      return :draw
    when 1
      return @name1
    else
      return @name2
    end
  end
end
