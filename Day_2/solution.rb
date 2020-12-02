class CheckPassword

  attr_reader :file, :file_data, :valid_passwords_old_policie, :valid_passwords_new_policie

  def initialize(log)
    @file = File.open(log)
    @file_data = file.readlines.map { |item| item.split(" ")}
    @valid_passwords_old_policie = 0
    @valid_passwords_new_policie = 0
  end

  def pass_checker_old_policie
    file_data.each do |data|
      range_start = data[0].split('-')[0].to_i
      range_end = data[0].split('-')[1].to_i
      key_letter = data[1].split('')[0]
        if data[2].count(key_letter) >= range_start && data[2].count(key_letter) <= range_end
          @valid_passwords_old_policie +=1
        end
    end
    valid_passwords_old_policie
  end

  def pass_checker_new_policie
    file_data.each do |data|
      position_start = data[0].split('-')[0].to_i
      position_end = data[0].split('-')[1].to_i
      key_letter = data[1].split('')[0]
      if data[2][position_start - 1] === key_letter && data[2][position_end - 1] === key_letter
        @valid_passwords_old_policie += 0
      elsif data[2][position_start - 1] === key_letter && data[2][position_end - 1] != key_letter
        @valid_passwords_new_policie +=1 
      elsif data[2][position_start - 1] != key_letter && data[2][position_end - 1] === key_letter
        @valid_passwords_new_policie +=1 
      elsif data[2][position_start - 1] != key_letter && data[2][position_end - 1] != key_letter
        @valid_passwords_new_policie += 0 
      end
    end
    valid_passwords_new_policie
  end


end

a = CheckPassword.new('./Day_2/data.log')
#PART 1 SOLUTION
puts "The number of valid passwords according to the old policie is: #{a.pass_checker_old_policie}" 
#PART 2 SOLUTION
puts "The number of valid passwords according to the new policie is: #{a.pass_checker_new_policie}" 
