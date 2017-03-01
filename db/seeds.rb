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
  child1 = Node.new(question_s: "Child#{i}")
  child1.node = top
  child1.save!
  answer1 = MiddleAnswer.new(name: "Level2Child#{i}Answer")
  answer1.node = child1
  answer1.save!
  3.times do |j|
    child2 = Node.new( question_s: "Child#{i}Child#{j}")
    child2.node = child1
    child2.save!
    answer2 = MiddleAnswer.new(name: "Level2Child#{i}Child#{j}Answer")
    answer2.node = child2
    answer2.save!
    3.times do |x|
      child3 = Node.new(
          question_s: "Child#{i}Child#{j}Child#{x}"
        )
      child3.node = child3
      child3.save!
      answer3 = FinalAnswer.new(
        name: Faker::StarWars.planet,
        message: Faker::StarWars.quote,
        photo: "https://www.yorkcountygov.com/_fileUploads/images/Slide23.JPG"
        )
      answer3.node = child3
      answer3.save!
    end
  end
end
