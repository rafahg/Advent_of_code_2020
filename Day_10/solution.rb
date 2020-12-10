data = File.readlines('./Day_10/data.txt', chomp:true).map(&:to_i)


 arr = data.sort
adapters_to_examine = arr.size - 1
jolt_1 = 1
jolt_3 = 1

adapters_to_examine.times do |i|
  j = i + 1
  jolt_1 +=1 if arr[i] == arr[j] - 1
  jolt_3 +=1 if arr[i] == arr[j] - 3
end
p arr
puts jolt_1 * jolt_3
