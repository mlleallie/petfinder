require 'httparty'
require 'pry'

puts 'Welcome to the Pet Finder'
puts 'What is your zipcode?'
zip = gets.strip.downcase
puts 'Are you a dog or cat person?'
gets.strip
puts "Let's not get ahead of ourselves just yet. Do you live an a house or an apartment?"
 living = gets.strip.downcase
  if living == "house"
   puts "Alright, do you even lift bro?(y/n)"
   lift = gets.strip.downcase
  else
   "Intersting "
  end

  if lift == "y"
   puts "Yeah you look great! Would you say that you're patient?(y/n)"
   strong_patient = gets.strip.downcase
  else
   puts "You don't need to, you look great! Would you say that you're(y/n)"
   weak_patient = gets.strip.downcase
  end

  if strong_patient == "y"
   puts "You're grrrreat for a puppy! "
  else
  end 
