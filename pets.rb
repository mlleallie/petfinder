require 'httparty'
require 'pry'


random_pet = HTTParty.get("http://api.petfinder.com/pet.getRandom?format=json&key=2fb23a71a91f020950eb1c8c33d73982")
random_dog = HTTParty.get("http://api.petfinder.com/pet.getRandom?format=json&key=2fb23a71a91f020950eb1c8c33d73982&animal=dog")


def open_dog

 system("open #{random_dog} ")

end

open_dog.new
