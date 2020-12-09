 INPUT = File.readlines('./Day_9/data.txt', chomp:true).map(&:to_i)
 #arr = INPUT.slice(0, INPUT.index(90433990))


 # first a range in input, which is the first 5 numbers
 # and a number to check, the next after the range.



def solution_1

  sums = []
  start_point = 0
  index_number_to_check = 25

  while true
    
  number_to_check = INPUT[index_number_to_check]
  range = INPUT.slice(start_point,25)

  for i in 0..range.length - 1
    k = i + 1
    for k in k..range.length - 1
      sum_result = range[i] + range[k]
      sums << sum_result
    end
  end
  start_point +=1
  index_number_to_check +=1
  if sums.include?(number_to_check) == false
    puts "The number is #{number_to_check}"
    exit
  end
  sums = []
  end
  number_to_check
end


=begin arr = []
result = []
 #p a = INPUT.index(90433990)
 #p b = INPUT[a]
for i in 0..INPUT.length - 1
  k = i + 1
  for k in k..INPUT.length 
   result = [INPUT.slice(i,k)]
   
   sum = result.map(&:sum)
   if sum[0] == 127
    puts result[0].min + result[0].max
   end
   arr << result
  end
end

b = []
arr.each do |item|
  b << item[0].sum
end
p arr 
=end

number = 127

INPUT.size.times do |i|
  j = i + 1

  while true 
    range = INPUT[i..j]
    p range
    sum = range.sum 
    if sum == number
      puts range.minmax.sum 
      exit
    end 
  break if sum > number
  j +=1
  end
end