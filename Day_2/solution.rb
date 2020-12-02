class CheckPassword

  attr_reader :file, :file_data, :solution

  def initialize(log)
    @file = File.open(log)
    @file_data = file.readlines.map { |item| item.split(" ")}
    @solution = 0
  end

  def pass_checker
    file_data.each do |data|
      range_start = data[0].split('-')[0].to_i
      range_end = data[0].split('-')[1].to_i
      key_letter = data[1].split('')[0]
      if data[2].count(key_letter) >= range_start && data[2].count(key_letter) <= range_end
        @solution +=1
      end
    end
    solution
  end


end

a = CheckPassword.new('./Day_2/data.log')
a.file_data
p a.pass_checker