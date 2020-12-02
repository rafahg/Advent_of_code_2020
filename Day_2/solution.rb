class CheckPassword

  attr_reader :file, :file_data, :valid_passwords_old_policy, :valid_passwords_new_policy

  def initialize(log)
    @file = File.open(log)
    @file_data = file.readlines.map { |item| item.split(" ")}
    @valid_passwords_old_policy = 0
    @valid_passwords_new_policy = 0
  end

  def pass_checker_old_policy
    file_data.each do |data|
      range_start = data[0].split('-')[0].to_i
      range_end = data[0].split('-')[1].to_i
      key_letter = data[1].split('')[0]
        if data[2].count(key_letter) >= range_start && data[2].count(key_letter) <= range_end
          @valid_passwords_old_policy +=1
        end
    end
    valid_passwords_old_policy
  end

  def pass_checker_new_policy
    file_data.each do |data|
      position_start = data[0].split('-')[0].to_i
      position_end = data[0].split('-')[1].to_i
      key_letter = data[1].split('')[0]
      if data[2][position_start - 1] === key_letter && data[2][position_end - 1] === key_letter
        @valid_passwords_old_policy += 0
      elsif data[2][position_start - 1] === key_letter && data[2][position_end - 1] != key_letter
        @valid_passwords_new_policy +=1 
      elsif data[2][position_start - 1] != key_letter && data[2][position_end - 1] === key_letter
        @valid_passwords_new_policy +=1 
      elsif data[2][position_start - 1] != key_letter && data[2][position_end - 1] != key_letter
        @valid_passwords_new_policy += 0 
      end
    end
    valid_passwords_new_policy
  end


end

a = CheckPassword.new('./Day_2/data.log')
#PART 1 SOLUTION
puts "The number of valid passwords according to the old policy is: #{a.pass_checker_old_policy}" 
#PART 2 SOLUTION
puts "The number of valid passwords according to the new policy is: #{a.pass_checker_new_policy}" 
