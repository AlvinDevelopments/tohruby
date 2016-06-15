num_moves = 0

print "Enter stack size: "
size = Integer(gets.chomp)

rods = Array.new(3)


i = 0

while i < size do
  rods[i] = Array.new(3,0)
  i+=1
end

i = 0

rod_stack = Array.new(3)

while i < size do
  rods[0][i] = i+1
  i+=1
end

rod_stack[0] = size-1
rod_stack[1] = 0
rod_stack[2] = 0


winning_array = Array.new(size)

j = 1

winning_array.each do |x|

winning_array[j-1] = j
j+=1

end


puts "RENDERING...."
puts "---------------"
puts "MOVES: #{num_moves}"
puts "---------------"
print "COL1|"
i = 0
rods[0].size.times do
  if rods[0][i] != 0
    print "(#{rods[0][i]})"
  end
  i+=1
end
puts ""
print "COL2|"
i = 0
rods[1].size.times do
  if rods[1][i] != 0
    print "(#{rods[1][i]})"
  end
  i+=1
end
puts ""
print "COL3|"
i = 0
rods[2].size.times do
  if rods[2][i] != 0
    print "(#{rods[2][i]})"
  end
  i+=1
end
puts ""
puts "---------------"

while true

if winning_array.size==rods[2].size && winning_array&rods[2]==winning_array
  puts "YOU WON WITH #{num_moves} MOVES!!!!"
  break
end

puts "Enter src: "
input = gets.chomp
if input == "q"
  puts "USER ENDED"
  break
end
src = Integer(input) - 1
puts "Enter dest: "
input = gets.chomp
if input == "q"
  puts "USER ENDED"
  break
end
dest = Integer(input) - 1


if rods[src][rod_stack[src]] > rods[dest][rod_stack[dest]] && rod_stack[dest] < size && rod_stack[src] >= 0
  unless rods[dest][rod_stack[dest]] == 0
    rod_stack[dest] += 1
  end
  rods[dest][rod_stack[dest]] = rods[src][rod_stack[src]]
  rods[src][rod_stack[src]] = 0
  unless rod_stack[src] == 0
    rod_stack[src] -= 1
  end

  num_moves += 1

  puts "RENDERING...."
  puts "---------------"
  puts "MOVES: #{num_moves}"
  puts "---------------"
  print "COL1|"
  i = 0
  rods[0].size.times do
    if rods[0][i] != 0
      print "(#{rods[0][i]})"
    end
    i+=1
  end
  puts ""
  print "COL2|"
  i = 0
  rods[1].size.times do
    if rods[1][i] != 0
      print "(#{rods[1][i]})"
    end
    i+=1
  end
  puts ""
  print "COL3|"
  i = 0
  rods[2].size.times do
    if rods[2][i] != 0
      print "(#{rods[2][i]})"
    end
    i+=1
  end
  puts ""
  puts "---------------"



else
  puts "INVALID MOVE"
end

end
