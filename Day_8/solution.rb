input = File.readlines('./Day_8/data.txt', chomp:true).map {|item| item.split(" ")}

index = 0
accumulator = 0
line_readed = []

while true

  if line_readed.include?(index)
    puts "Value of the accumulator is #{accumulator}"
    exit
  end

    line_readed << index 

    operation = input[index][0]
    argument = input[index][1].to_i

  if operation == "acc" 
    accumulator += argument
  elsif operation == "jmp"
    p index = index + (argument - 1) # to make null the index + 1 needed in the next line.
  end
  index +=1
end


