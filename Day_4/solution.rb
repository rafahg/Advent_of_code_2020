class PassportValidator

  attr_reader :data, :counter, :input, :organised_input

  def initialize
    @input = File.open('./Day_4/data.log').to_a.map(&:chomp)
    @data = []
    @counter = 0
  end


  def organised_input 
    input.each { |item| item.empty? ? data.push(" ") : data.push(item) }
  end

  def password_checker
    data.each { |passport| @counter +=1 if passport.size == 7 }
  end

end

 a = PassportValidator.new
 a.organised_input
 a.password_checker
 p a.data

