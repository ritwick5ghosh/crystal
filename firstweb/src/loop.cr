n=1000000
x=0
n.times do
  x +=1
end

puts x

d = Dir.entries(".")
puts d.size()

puts `date`
