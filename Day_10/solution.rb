DATA = File.readlines('./Day_10/data.txt', chomp:true).map(&:to_i)

def solution_1
  arr = DATA.sort
  adapters_to_examine = arr.size - 1
  jolt_1 = 1
  jolt_3 = 1

  adapters_to_examine.times do |i|
    j = i + 1
    jolt_1 +=1 if arr[i] == arr[j] - 1
    jolt_3 +=1 if arr[i] == arr[j] - 3
  end
  p arr
  p jolt_1
  p jolt_3
  jolt_1 * jolt_3
end


arr = DATA.sort
options = Hash.new(0)
options[0] = 1
p options
maximum_jolt = arr.last + 3
prepared_array = arr.push(maximum_jolt)


prepared_array.each do |target_jolts|
  p options
   options[target_jolts] = [1, 2, 3]
    .sum { |difference| options[target_jolts - difference] }
end

p  options[maximum_jolt]





