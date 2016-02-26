require 'httparty'
require 'pry'
require_relative 'pets'
require 'colorize'
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
▄             ▄▄▄▄▄▄▄▄▄▄▄  ▄                  ▄▄▄▄▄▄▄▄▄▄   ▄         ▄  ▄▄▄▄▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄   ▄        ▄
▐░▌          ▐░░░░░░░░░░░▌▐░▌               ▐░░░░░░░░░░▌ ▐░▌       ▐░▌▐░░░���░░░░░░▌ ▐░░░░░░░░░ ▐░▌       ▐░▌
▐░▌           ▀▀▀▀█░█▀▀▀▀ ▐░▌               ▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌▐░█▀▀▀▀▀▀▀█░▌▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌
▐░▌               ▐░▌     ▐░▌               ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌
▐░▌               ▐░▌     ▐░▌               ▐░█▄▄▄▄▄▄▄█░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░█▄▄▄▄▄▄▄█░▌
▐░▌               ▐░▌     ▐░▌               ▐░░░░░░░░░░▌ ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░░░░░░░░░░░▌
▐░▌               ▐░▌     ▐░▌               ▐░█▀▀▀▀▀▀▀█░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌ ▀▀▀▀█░█▀▀▀▀
▐░▌               ▐░▌     ▐░▌               ▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌▐░▌       ▐░▌     ▐░▌
▐░█▄▄▄▄▄▄▄▄▄  ▄▄▄▄█░█▄▄▄▄ ▐░█▄▄▄▄▄▄▄▄▄      ▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌▐░█▄▄▄▄▄▄▄█░▌     ▐░▌
▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌▐░░░░░░░░░░░▌     ▐░░░░░░░░░░▌ ▐░░░░░░░░░░░▌▐░░░░░░░░░░▌ ▐░░░░░░░░░░▌      ▐░▌
▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀▀       ▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀▀▀▀▀▀▀  ▀▀▀▀▀▀▀▀▀▀   ▀▀▀▀▀▀▀▀▀▀        ▀'.colorize(:blue)
puts 'What is your zipcode?'
@animal_location = gets.strip.downcase
puts 'Are you a dog or cat person?'
gets.strip
puts "Let's not get ahead of ourselves just yet. Do you live an a house or an apartment?".colorize(:red)

 living = gets.strip.downcase

    if living == "house"
     puts "Alright, do you even lift bro?(y/n)"
     lift = gets.strip.downcase
     @animal_type = "dog"

    else
    puts "Sorry boutcha! Do you have a lot of friends? (y/n)"
    friends = gets.strip.downcase
    @animal_type = "cat"
end

###cat questions

    if friends == "y" || friends == "yes"
     puts "That haircut does make you look popular. Do you get along better with ladies or gents?"
     gender = gets.strip.downcase
     @animal_age = "Adult"
    elsif friends == "n" || friends == "no"
     puts "That's okay, introverts are super 'in' right now. Would you rather read a book or watch netflix?"
     activity = gets.strip.downcase
     @animal_age = "Baby"
    end

    if gender == "ladies"
     puts "Great! Check out this lonely lady cat who's just waiting for you to adopt her!"
     @animal_sex = "F"
    elsif gender == "gents"
     puts "Awesome, this old dude is just waiting for your snuggles."
     @animal_sex = "M"
    end

    if activity == "book" || activity == "read a book"
     puts "Cool, reading is great but not for your body. Get in some exercise playing with this tiny adorable lady kitty!"
     @animal_sex = "F"
    elsif activity == "netflix" || activity == "watch netflix"
     puts "TV will rot your brain. Instead, adopt this rambunctious little dude to keep your brain and body active!"
     @animal_sex = "M"
    end

  #### dog questions
    if lift == "y" || lift == "yes"
     puts "Yeah you look great! Would you say that you're patient?(y/n)"
     strong_patient = gets.strip.downcase
     @animal_size = "L"
    elsif lift == "n" || lift == "no"
     puts "You don't need to, you look great! Would you say that you're patient?(y/n)"
     weak_patient = gets.strip.downcase
     @animal_size = "S"
    end

    if strong_patient == "y" || strong_patient == "yes"
      puts "Good for you, maybe you could teach Zolon a thing or two! How about vegetables? Do you prefer peas, cucumbers, or cauliflower?"
      patient_veggies = gets.strip.downcase
    elsif strong_patient == "n" || strong_patient == "no"
      puts " Well, there's a reason it's a virtue and not a requirement. Would you rather take a nap or go for a run?"
      impatient = gets.strip.downcase
      @animal_age = "Adult"
    end

    if weak_patient == "y" || weak_patient == "yes"
      puts "You are a veritable Mother Theresa. Do you think it's funny when dogs poop? (y/n)"
      pooping_dog = gets.strip.downcase
      @animal_age = "Baby"
    elsif weak_patient == "no" || weak_patient == "n"
      puts "Your parents probably let you watch a lot of TV growing up, huh? Pick one: boogers or earwax."
      gross = gets.strip.downcase
      @animal_age = "Adult"
    end

    if pooping_dog == "yes" || pooping_dog == "y"
      puts "Haha yeah... it's pretty funny... See a pooping dog every day and adopt this cutie-patootie"
      @animal_sex = "F"
    elsif pooping_dog == "no" || pooping_dog == "n"
      puts "Not everyone can have such a sophisticated sense of humor. I bet this dude could help you learn to laugh a bit more easily..."
      @animal_sex = "M"
    end

    if gross == "boogers"
      puts "Ew, don't eat that."
      @animal_sex = "M"
    elsif gross == "earwax" || gross == "ear wax"
      puts "Calm down, flush out those ear-babies, and bring home this lil buddy today!"
      @animal_sex = "F"
    end

    if patient_veggies == "peas"
      puts "Do you like cheetos or hummus more?"
      tasty_noms = gets.strip.downcase
      @animal_age = "Baby"
    elsif patient_veggies == "cucumbers"
      puts "Would you rather get a manicure or a pedicure?"
      mani_pedi = gets.strip.downcase
      @animal_age = "Young"
    elsif patient_veggies == "cauliflower"
      puts "Do you prefer pants or shorts?"
      jorts = gets.strip.downcase
      @animal_age = "Senior"
    end

    if impatient == "take a nap" || impatient == "nap"
      puts "You should probably adopt this adorable grown ass woman dog!"
      @animal_sex = "F"
    elsif impatient == "go for a run" || impatient == "run"
      puts "This ol' dude needs a home, could you be the one?"
      @animal_sex = "M"
    end

    if tasty_noms == "cheetos"
      puts "Cheetos are awesome, and so is this presh little lady!"
      @animal_sex = "F"
    elsif tasty_noms == "hummus"
      puts "I'm assuming you're referring to Grandma's Hummus. As reward for your good taste, pat yourself on the back and adopt this sweet little gentleman!"
      @animal_sex = "M"
    end

    if mani_pedi == "manicure" || mani_pedi == "mani"
      puts "Such luxury deserves a new best friend, check out this classy little lady waiting for you to take her home!"
      @animal_sex = "F"
    elsif mani_pedi == "pedicure" || mani_pedi == "pedi"
      puts "Dang, I could go for a footrub right now. Almost as good is letting this little dude lick your piggies... bring him home today!"
      @animal_sex = "M"
    end

    if jorts == "shorts"
      puts "Ah, nothing like a summer breeze on the gams to keep things cool. You could be standing in barkingsprings with this fella now if you play your cards right..."
      @animal_sex = "M"
    elsif jorts == "pants"
      puts "Your butt looks great in jeans. Your butt also looks great cuddling with this gal... bring her home today!"
      @animal_sex = "F"
    end

FindPet.new(@animal_type, @animal_size, @animal_age, @animal_sex, @animal_location).random_animal
