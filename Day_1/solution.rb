class AccountsManager
  attr_reader :file, :file_data, :result_double, :result_triple
  def initialize(log)
    @file = File.open(log)
    @file_data = file.readlines.map(&:chomp).map(&:to_i)
    @result_double = []
    @result_triple = []
  end

  

  def sum_double(arr)
    for i in 0..arr.length - 1 
      k = i + 1 
      for k in k..arr.length - 1
        sum_result = arr[i] + arr[k]
          if sum_result == 2020
            result_double.push(arr[i] * arr[k])
          end
      end
    end
  end 

  
  
  
  def sum_triple(arr)
    for i in 0..arr.length - 1
      k = i + 1
      for k in k..arr.length - 1
        x = k + 1
        for x in x..arr.length - 1
        sum_result = arr[i] + arr[k] + arr[x]
          if sum_result == 2020
            result_triple.push(arr[i] * arr[k] * arr[x])
          end
        end
      end
    end
  end


end

a = AccountsManager.new('./Day_1/data.log')
a.sum_double(a.file_data)
a.sum_triple(a.file_data)

puts "First result is: #{a.result_double[0]}"
puts "Second result is: #{a.result_triple[0]}"