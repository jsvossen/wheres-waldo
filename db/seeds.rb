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
	puzzle.targets.build(name: "Waldo", width: 32, height: 42, x: 510, y: 348)
	puzzle.targets.build(name: "Wizard", width: 40, height: 63, x: 608, y: 344)
	puzzle.targets.build(name: "Odlaw", width: 22, height: 55, x: 230, y: 348)
end


Puzzle.where(title: "The Cake Factory").first_or_create do |puzzle|
	puzzle.image = "cake-factory.jpg"
	puzzle.difficulty = "medium"
	puzzle.targets.build(name: "Waldo", width: 22, height: 30, x: 645, y: 64)
	puzzle.targets.build(name: "Wenda", width: 25, height: 40, x: 650, y: 631)
	puzzle.targets.build(name: "Odlaw", width: 22, height: 38, x: 331, y: 461)
end

Puzzle.where(title: "The Gobbling Gluttons").first_or_create do |puzzle|
	puzzle.image = "gluttons.jpg"
	puzzle.difficulty = "hard"
	puzzle.targets.build(name: "Waldo", width: 20, height: 40, x: 414, y: 190)
	puzzle.targets.build(name: "Wenda", width: 20, height: 30, x: 154, y: 169)
	puzzle.targets.build(name: "Wizard", width: 35, height: 55, x: 810, y: 634)
	puzzle.targets.build(name: "Odlaw", width: 20, height: 35, x: 172, y: 415)
end