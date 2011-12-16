puts 'The guessing game!'

x = rand(10)
g = -1

while x != g
  puts 'Please guess:'
  g = gets.to_i
  puts 'Too low.' if g < x
  puts 'Too high.' if g > x
end

puts 'Yay!'
