require 'pry'

class Owner
  attr_accessor :name, :pets, :mood
  attr_reader :species
  OWNERS = []
  # code goes here
  def initialize(species)
    @species = species
    OWNERS << self
    dog = Dog.new(name)
    cat = Cat.new(name)
    fish = Fish.new(name)


    @pets = {
      fishes: [],
      dogs: [],
      cats: []

    }

  end

  def self.reset_all
    OWNERS.clear
  end

  def self.all
    OWNERS
  end

  def self.count
    OWNERS.count

  end

  def say_species
    "I am a #{species}."

  end

  def buy_fish(name)
    pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    pets[:dogs] << Dog.new(name)
  end

  def walk_dogs
    pets[:dogs].each do |pet|
      pet.mood = "happy"
    end

  end

  def play_with_cats
    pets[:cats].each do |pet|
      pet.mood = "happy"
    end
  end

  def feed_fish
    pets[:fishes].each do |pet|
      pet.mood = "happy"
    end
  end

  def sell_pets
    pets.each do |pet_type|
      [pet_type].each do |pet|
        pet[1].each do |ele|
          ele.mood = "nervous"
        end
      end
    end
    self.pets.each do |pet_hash|
        pet_hash[1].clear
    end
  end

  def list_pets
    num_fish = self.pets[:fishes].count
    num_dogs = self.pets[:dogs].count
    num_cats = self.pets[:cats].count
    "I have #{num_fish} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

end
