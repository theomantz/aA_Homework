require 'byebug'
fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']



def sluggish_octopus(fish)
    sorted = false
    until sorted
        sorted = true
        fish[0...-1].each_index do |i|
            if (fish[i].length <=> fish[i + 1].length) == 1
                sorted = false  
                fish[i], fish[i+ 1] = fish[i + 1], fish[i] 
            end
        end
    end
    fish.last
end

# p sluggish_octopus(fish)

def dominant_octopus(array, &prc)
    # debugger
    return array if array.length <= 1
    # prc = Proc.new{ |a, b| a.length <=> b.length }
    pivot = array.first
    left, right = array[1..-1].partition { |el| prc.call(pivot,el) == 1 }
    dominant_octopus(left, &prc) + [pivot] + dominant_octopus(right, &prc)
end

# dominant_octopus(fish) { |a, b| a.length <=> b.length }