def div_by_fifteen(n)
  n % 15 == 0
end

def div_by_three(n)
  n % 3 == 0
end

def div_by_five(n)
  n % 5 == 0
end

1...100.times do |num|
  answer = ""

  answer = if div_by_fifteen num
    "FizzBuzz"
  elsif div_by_five(num)
    "Buzz"
  elsif div_by_three(num)
    "Fizz"
  else
    "-"
  end

  puts answer    
end
