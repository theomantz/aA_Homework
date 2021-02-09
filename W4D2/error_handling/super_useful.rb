# PHASE 2
def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    else
      raise StandardError
    end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  begin
  reaction(maybe_fruit) 
  rescue StandardError => e
    retry if maybe_fruit == 'coffee'
  end
end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    string_error(name, fav_pastime)
    yrs_known_error(yrs_known)
    @name = name
    @fav_pastime = fav_pastime
  end
  
  def yrs_known_error(years)
    if years >= 5
      @yrs_known = years
    else
      raise ArgumentError.new("This aint twitter pal. We got a 5 year minimum for friendship")
    end
  end

  def string_error(name, fav_pastime)
    if name.count <= 0 || fav_pastime.count <= 0
      raise ArgumentError.new("You're gonna have to do better than that if you think you know me!")
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


