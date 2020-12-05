
  INPUT = File.open('./Day_4/data.txt').read.chomp("\n")
  FIELD_MATCHER = /(?<name>[[:alpha:]]{3})\:(?<value>.*)/

class PassportValidator

  attr_accessor :data, :counter, :passports

  def initialize
   
    @data = []
    @counter = 0
    @passports = passports
  end


  def organised_input 
    @input.each { |item| item == "\n" ? @data.push("new_passport") : @data.push(item) }
  end 

  def individual_passports
    @passports = @data.join.split("new_passport").map! { |item| item.gsub("\n", " ").split(" ")}
  end
  

  def password_checker
     @passports.each do |passport|
        if passport.join.include?("cid:") && passport.size == 8
          @counter +=1
        elsif passport.join.include?("cid:") == false && passport.size == 7
          @counter +=1
        end
     end
  end



  PASSPORTS = INPUT.split("\n\n").map do |data|
    data.split("\n").each_with_object({}) do |field, passport|
      field_data = field.match(FIELD_MATCHER)
      passport[field_data[:name]] = field_data[:value]
    end
  end

  p PASSPORTS


end




#  thing = a.data.join.split("new_passport").map! { |item| item.gsub("\n", " ")}

 # other_thing = thing.map { |item| item.split(" ")}
 




