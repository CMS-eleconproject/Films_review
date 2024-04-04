# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Create films
films = Film.create([
  { title: "The Shawshank Redemption", release_date: "1998-11-29", director: "Frank Darabont", description: "Over the course of several years, two convicts form a friendship, seeking consolation and, eventually, redemption through basic compassion.", poster_url: "https://th.bing.com/th/id/OIP.yobjBRMMdekQvZwGHeebKgHaLH?rs=1&pid=ImgDetMain" },
  { title: "12 Angry Men", release_date: "2003-04-04", director: " Sidney Lumet", description: "The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.", poster_url: "https://th.bing.com/th/id/R.380fcd1a59d1fd26d9205f1fd90f0d68?rik=Fu2zBN3pyiERWQ&pid=ImgRaw&r=0" },
  { title: "Interstellar", release_date: "2003-11-29", director: " Christopher Nolan", description: "When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.", poster_url: "https://th.bing.com/th/id/OIP.G29hHwy5_34KwzHphORLDAHaLH?rs=1&pid=ImgDetMain" }
])

# Create reviews for each film
films.each do |film|
  3.times do |i|
    film.reviews.create(content: "Review #{i+1} for #{film.title}", rating: rand(1..5))
  end
end
