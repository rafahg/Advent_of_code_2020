INPUT = File.open('./Day_11/data.txt').read 
p INPUT
FLOORPLAN = INPUT.split("\n").each_with_object({}).with_index do |(line, grid), y|
  line.split("").each_with_index { |seat, x| grid[[x, y]] = seat }
end

p FLOORPLAN