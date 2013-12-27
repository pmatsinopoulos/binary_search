# This program asks the user to give a maximum number
# and then set in his/her mind a number from 1 up to this maximum number.
#
# Then computer is trying to guess this number. The user only has to answer
# whether the correct answer is lower than or greater than the guess that
# computer makes
print 'Give me the maximum number: '
maximum_number = gets.to_i
print "Set a number in your head from 1 up to #{maximum_number}. When done, hit <enter>"
gets.strip

found = false
high  = maximum_number
low   = 1
number_of_guesses = 0
maximum_number_of_guesses = Math.log2(maximum_number).ceil
while !found && number_of_guesses < maximum_number_of_guesses 
  guess = low + (high - low ) / 2
  number_of_guesses += 1
  print "Is it #{guess}?(yes|no)"
  found = gets.strip.downcase == "yes"
  unless found 
    print "Is it greater than #{guess}?(yes|no)"
    greater = gets.strip.downcase == "yes"
    if greater && guess < maximum_number 
      low = guess + 1
    elsif !greater && guess > 1 
      high = guess - 1
    end
  end
end

if !found && number_of_guesses >= maximum_number_of_guesses
  puts "Are you sure that you have given the correct answers? I should have found the answer after #{maximum_number_of_guesses} guesses. But I am already on #{number_of_guesses}"
end

if found
  puts "I have found the number #{guess} after #{number_of_guesses} guesses (when maximum number of guesses would have been: #{maximum_number_of_guesses})"
end

