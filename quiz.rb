require 'httparty'
require 'pry'
puts '
▄▄▄▄▄▄▄▄▄▄▄       ▄▄        ▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄▄  ▄▄▄▄▄▄▄▄▄▄        ▄▄▄▄▄▄▄▄▄▄▄
▐░░░░░░░░░░░▌     ▐░░▌      ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░▌      ▐░░░░░░░░░░░▌
▀▀▀▀█░█▀▀▀▀      ▐░▌░▌     ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀█░▌     ▐░█▀▀▀▀▀▀▀█░▌
    ▐░▌          ▐░▌▐░▌    ▐░▌▐░▌          ▐░▌          ▐░▌       ▐░▌     ▐░▌       ▐░▌
    ▐░▌          ▐░▌ ▐░▌   ▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░▌       ▐░▌     ▐░█▄▄▄▄▄▄▄█░▌
    ▐░▌          ▐░▌  ▐░▌  ▐░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░▌       ▐░▌     ▐░░░░░░░░░░░▌
    ▐░▌          ▐░▌   ▐░▌ ▐░▌▐░█▀▀▀▀▀▀▀▀▀ ▐░█▀▀▀▀▀▀▀▀▀ ▐░▌       ▐░▌     ▐░█▀▀▀▀▀▀▀█░▌
    ▐░▌          ▐░▌    ▐░▌▐░▌▐░▌          ▐░▌          ▐░▌       ▐░▌     ▐░▌       ▐░▌
▄▄▄▄█░█▄▄▄▄      ▐░▌     ▐░▐░▌▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄ ▐░█▄▄▄▄▄▄▄█░▌     ▐░▌       ▐░▌
▐░░░░░░░░░░░▌     ▐░▌      ▐░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░▌      ▐░▌       ▐░▌
▀▀▀▀▀▀▀▀▀▀▀       ▀        ▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀        ▀         ▀

▄            ▄▄▄▄▄▄▄▄▄▄▄  ▄                 ▄▄▄▄▄▄▄▄▄▄   ▄         ▄  ▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄   ▄         ▄
▐░▌          ▐░░░░░░░░░░░▌▐░▌               ▐░░░░░░░░░░▌ ▐░▌       ▐░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░▌ ▐░▌       ▐░▌
▐░▌           ▀▀▀▀█░█▀▀▀▀ ▐░▌               ▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌
▐░▌               ▐░▌     ▐░▌               ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌
▐░▌               ▐░▌     ▐░▌               ▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌
▐░▌               ▐░▌     ▐░▌               ▐░░░░░░░░░░▌ ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
▐░▌               ▐░▌     ▐░▌               ▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌ ▀▀▀▀█░█▀▀▀▀
▐░▌               ▐░▌     ▐░▌               ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌     ▐░▌
▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄█░█▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄      ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌     ▐░▌
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░▌      ▐░▌
▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀       ▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀▀▀▀▀▀        ▀


'
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
  puts "Sorry boutcha! Do you have a lot of friends? (y/n)"
  friends = gets.strip.downcase
end

  if friends == "y" || friends == "yes"
   puts "That haircut does make you look popular. Do you get along better with ladies or gents?"
   gender = gets.strip.downcase
  elsif friends == "n" || friends == "no"
   puts "That's okay, introverts are super 'in' right now. Would you rather read a book or watch netflix?"
   activity = gets.strip.downcase
  end

  if gender == "ladies"
   puts "Great! Check out this lonely lady cat who's just waiting for you to adopt her!"

  elsif gender == "gents"
   puts "Awesome, this old dude is just waiting for your snuggles."
  end

  if activity == "book" || activity == "read a book"
   puts "Cool, reading is great but not for your body. Get in some exercise playing with this tiny adorable lady kitty!"
  elsif activity == "netflix"
   puts "TV will rot your brain. Instead, adopt this rambunctious little dude to keep your brain and body active!"
  end
#### dog questions
  if lift == "y" || lift == "yes"
   puts "Yeah you look great! Would you say that you're patient?(y/n)"
   strong_patient = gets.strip.downcase
  elsif lift == "n" || lift == "no"
   puts "You don't need to, you look great! Would you say that you're(y/n)"
   weak_patient = gets.strip.downcase
  end

  if strong_patient == "y" || strong_patient == "n"
   puts "You're grrrreat for a puppy but, I still have a few more questions"
   puts "If you were a vegetable would you be a cucumber, cauliflower, or pea?"
   veggie = gets.strip.downcase
  end

  if weak_patient == "y" || weak_patient == "n"
   puts "You're grrrreat for a older dog but, I still have a few more questions"
   puts "If you were a vegetable would you be a cucumber, cauliflower, or pea?"
   weak_veggie = gets.strip.downcase
  end

  if veggie == "cucumber"
   puts "You need a  young big dog!!"
  elsif veggie == "pea"
   puts "You should get a  young little dog"
  elsif veggie == "cauliflower"
   puts "Wow a medium dog for a  young medium tasting vegetable"
  end


 if weak_veggie == "cucumber"
  puts "You need a older big dog!!"
 elsif weak_veggie == "pea"
  puts "You should older get a little dog"
 elsif   weak_veggie == "cauliflower"
  puts "Wow an older young medium dog for a medium tasting vegetable"
 end
