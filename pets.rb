require 'httparty'
require 'pry'


 class FindPet
   def initialize(animal_type, animal_size, animal_age, animal_sex, animal_location)
     @animal_type = animal_type
     @animal_size = animal_size
     @animal_age = animal_age
     @animal_sex = animal_sex
     @animal_location = animal_location
   end

 def random_animal
   random_animal = HTTParty.get("http://api.petfinder.com/pet.getRandom?format=json&key=2fb23a71a91f020950eb1c8c33d73982&location=#{@animal_location}&distance=50&animal=#{@animal_type}&size=#{@animal_size}&age=#{@animal_age}&sex=#{@animal_sex}")
   random_animal_array = random_animal["petfinder"]["petIds"]
   random_animal_id = random_animal_array["id"]["$t"]
   url = "https://www.petfinder.com/petdetail/" + random_animal_id
   system("open #{url}")
 end

 end

# def find_large_dog
#  random_dog = HTTParty.get("http://api.petfinder.com/pet.getRandom?format=json&key=2fb23a71a91f020950eb1c8c33d73982&animal=dog&size=L&age=Adult")
#  random_dog_ids = random_dog["petfinder"]["petIds"]
#  random_dog_id = random_dog_ids["id"]["$t"]
#  url = "https://www.petfinder.com/petdetail/" + random_dog_id
#  system("open #{url}")
# end
