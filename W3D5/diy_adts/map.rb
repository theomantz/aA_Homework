class Map

    def initialize
        @map =[]
    end

    def set(key, value)
        return @map << [key, value] if @map.empty?
        @map.each_with_index do |map_pair, index|
            map_key, map_value = map_pair
            return @map[index] = [map_key, value] if map_key == key
        end
        return @map << [key, value]
    end

    def get(key)
        @map.each_with_index do |map_pair| 
            return map_pair[1] if map_pair[0] == key 
        end
        return nil
    end

    def delete(key)
        @map.delete_if { |map_pair| map_pair.first == key }
    end

    def keys
        @map.map { |map_pair| map_pair.first }.compact
    end

    def show
        show = @map.map do |map_pair|
            key, value = map_pair
            "{#{key} => #{value}}"
        end
        puts "{#{show.join(', ')}}"
    end

end

# p map = Map.new
# 10.times { map.set(rand(10), rand(100))}
# p map