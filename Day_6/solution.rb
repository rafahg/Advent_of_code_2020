DATA = File.readlines('./Day_6/data.txt', chomp: true).join("_").split("__")


def sum_all
  counter = 0
  DATA.each do |answers|
    answers.chars.uniq.each do |letter|
    counter +=1 if letter.match?(/[[:alpha:]]/)
    end
  end
  counter
end

def sum_trues
  counter = 0
  DATA.each do |answers|
   passengers = answers.count("_") + 1
   group = answers
    answers.chars.each do |letter|
     counter +=1 if group.count(letter) == passengers
     group.delete!(letter)
    end
  end
   counter
end

#PART 1 SOLUTION
puts "The sum of all counts is: #{sum_all}"

#PART 2 SOLUTION

puts "The sum of all question in which everyone said yes is: #{sum_trues}"

