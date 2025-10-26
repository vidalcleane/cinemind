require 'open-uri'

user = User.first
movie = user.movies.create!(
  title: "Teste Poster",
  synopsis: "Filme de teste",
  year: 2024,
  duration: 120,
  director: "Teste"
)

# Baixar uma imagem de teste
url = "https://via.placeholder.com/300x450.png/667eea/ffffff?text=POSTER+TESTE"
file = URI.open(url)
movie.poster.attach(io: file, filename: 'poster.png', content_type: 'image/png')

puts "Filme criado: #{movie.title}"
puts "Poster anexado? #{movie.poster.attached?}"
puts "URL do poster: #{Rails.application.routes.url_helpers.url_for(movie.poster) if movie.poster.attached?}"
