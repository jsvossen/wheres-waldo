# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Puzzle.where(title: "At the Beach").first_or_create do |puzzle|
	puzzle.image = "beach-easy.jpg"
	puzzle.difficulty = "easy"
end


Puzzle.where(title: "The Cake Factory").first_or_create do |puzzle|
	puzzle.image = "cake-factory.jpg"
	puzzle.difficulty = "medium"
end