# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Node.destroy_all

top = Node.new(name: "root")
top.save!
3.times do |i|
  child1 = Node.new(name: "Level1Child#{i}", question_s: "Child#{i}")
  child1.node = top
  child1.save!
  3.times do |j|
    child2 = Node.new(name: "Level2Child#{i}Child#{j}", question_s: "Child#{i}Child#{j}")
    child2.node = child1
    child2.save!
    3.times do |x|
      answer = Node.new(
          name: Faker::StarWars.planet,
          description: Faker::StarWars.quote,
        )
      answer.node = child2
      answer.save!
    end
  end
end
