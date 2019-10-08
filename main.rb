require_relative './fsm.rb'
puts "*" * 50
puts "welcome to FSM"
puts "please type in a input sequence ex: 1010"

puts "answer is: #{calculator(gets().strip)}"