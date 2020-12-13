INPUT = File.readlines('./Day_13/data.txt', chomp:true)
time = INPUT.first.to_i

bus_lines = INPUT.last.delete!('x').scan(/\d+/).map(&:to_i).sort

time_line = (time..time + 20).to_a
result = []

 while result.first == nil
  time_line.each do |minute|
    bus_lines.each do |bus|
      if minute % bus == 0
        result << [minute,bus]
      end
    end
  end
 end

p waiting_time = (result.first.first - time) * result.first[1]