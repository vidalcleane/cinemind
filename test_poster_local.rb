# Criar uma imagem fake em memória
require 'stringio'

user = User.first
movie = user.movies.create!(
  title: "Teste Poster Local",
  synopsis: "Filme de teste",
  year: 2024,
  duration: 120,
  director: "Teste"
)

# Criar um arquivo fake
fake_image = StringIO.new("fake image data")
movie.poster.attach(
  io: fake_image,
  filename: 'poster.png',
  content_type: 'image/png'
)

puts "✅ Filme criado: #{movie.title}"
puts "✅ Poster anexado? #{movie.poster.attached?}"
puts "✅ Blob ID: #{movie.poster.blob.id if movie.poster.attached?}"
