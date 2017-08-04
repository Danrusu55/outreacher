# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



10.times do
  Entry.create([{
    target_id: [2,3,4,5,6].sample,
    source: ["fb", "twitter", "ig", "blog", "linkedin"].sample,
    title: Faker::Hipster.unique.sentence,
    description: Faker::Hipster.unique.paragraph,
    grouping: ["activity","mentions","engaged","responded","conversing"].sample,
    date: Faker::Date.backward(days = 14),
    commentsretweets: rand(20),
    responses: rand(20),
    likes: rand(20),
    }])
end
