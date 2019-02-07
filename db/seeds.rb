# frozen_string_literal: true

Rails.application.eager_load!
models_array = [City, User, Gossip, Commentary, SubCommentary, Like]
# Sets the locale to "France":
Faker::Config.locale = 'fr'

puts "Effacement des bases de données des modèles #{models_array.join(' ')}."
puts '-' * 50
puts
models_array.each(&:destroy_all)
puts 'Effectué'
puts
puts 'Reinitialisation des index  de chaque table à 1'
puts
ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end
puts '-' * 50
puts
puts 'Effectué'
puts
puts "Création de tables de données pour #{models_array.join(' ')}"
puts '-' * 50
puts


models_items_count = Hash[ [['City', 10], ['User', 20], ['Gossip', 50],
                            ['Commentary', 100], ['SubCommentary', 40], ['Like', 300]] ]

models_array.each do |model|
  puts "Création de #{models_items_count[model.name]} items pour #{model.name}"
  models_items_count[model.name].times do
    i = 0
    case model.name
		when 'City'
			model.create(name: Faker::Nation.capital_city,
									 zip_code: Faker::Number.number(5).to_s)

    when 'User'
      while true
        user_name = Faker::DragonBall.unique.character
        break if user_name.length > 6
       end

      model.create(first_name: Faker::Name.first_name,
									 city: City.all.sample,
                   last_name: Faker::Name.last_name,
                   email: Faker::Internet.unique.email,
                   age: (1..89).to_a.sample,
                   user_name: user_name,
									 description: Faker::Lorem.words(90),
									 password: Faker::Internet.password(13, 25, true, true))

    when 'Gossip'
      model.create(author: User.all.sample,
                   title: Faker::Hacker.adjective,
                   text: Faker::ChuckNorris.fact)

    when 'Commentary'
      model.create(text: Faker::Hacker.say_something_smart,
                   author: User.all.sample,
                   gossip: Gossip.all.sample)
    when 'SubCommentary'
      a = model.create(text: Faker::Hacker.say_something_smart,
                       author: User.all.sample,
                       commentary: Commentary.all.sample)
      byebug unless a.valid?
    when 'Like'
      model.create(author: User.all.sample,
                   gossip: Gossip.all.sample)
    end
  end
end

puts 'Effectué'
puts
puts 'Impression des 3 derniers items de chaque table'
puts '-' * 50
puts

models_array.each do |model|
  puts "#{model.name} : #{model.count} items"
  unless models_items_count[model.name] == model.count
    puts "PROBLEME de Validation ? Le nombre d'items est différent du nbre prévu : #{models_items_count[model.name]}"
  end
  puts
  tp model.last(3)
  puts
end
