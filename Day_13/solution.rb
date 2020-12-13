INPUT = File.readlines('./Day_13/data.txt', chomp:true)
p time = INPUT.first
p bus_lines = INPUT.last.delete!('x').scan(/\d+/)
