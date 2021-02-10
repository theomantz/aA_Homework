class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    unless @game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
    seq.each do |color|
      puts "Round Number: #{sequence_length}"
      puts color
      sleep(1)
      system('clear')
    end
  end

  def require_sequence
    usr_seq = []
    sequence_length.times do
      puts "Repeat the colors you just saw"
      color = gets.chomp
      system('clear')
      usr_seq << color
    end
    unless usr_seq == seq
      @game_over = true
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Good Round!"
    sleep(1)
    system('clear')
  end

  def game_over_message
    puts "Game Over".center(20)
    puts "😢".center(20)
  end

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
  end
end
