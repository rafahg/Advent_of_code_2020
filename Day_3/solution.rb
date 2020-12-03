
class TobboganChart

# Boreal lines are the lines of the map extended 100 hundred times
# to the rigth.
  
  attr_reader :arr, :boreal_lines, :row_num

  def initialize
    @arr = File.readlines('./Day_3/data.log').map(&:chomp)
    @boreal_lines = @arr.map { |line| line * 100 }
    @boreal_lines_number = 0
  end

  def tree_counter(rigth, down)
    trees = 0
    position = 0

    boreal_lines.each do |line|
      if @boreal_lines_number % down == 0
        if line[position] == '#'
          trees +=1
        end
        position += rigth
      end
      @boreal_lines_number +=1
    end
    trees
  end

end

a = TobboganChart.new.tree_counter(3,1)
b = TobboganChart.new.tree_counter(1,1)
c = TobboganChart.new.tree_counter(5,1)
d = TobboganChart.new.tree_counter(7,1)
e = TobboganChart.new.tree_counter(1,2)

#Part 1 solution.
puts "The trees in my path are #{a}"

# Part 2 solution

puts "The trees in my path are #{a * b * c * d * e}"



