a = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]



puts 'with each'
x = 0
s = ''
a.each do |ae|
  x = x + 1
  s = s + ' ' + ae.to_s
  if x == 4
    x = 0
    puts s
    s = ''
  end
end

puts
puts 'with each_slice'
a.each_slice(4) {|ae| puts ae.join(' ')}

