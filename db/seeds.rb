puts "🗑️  Limpando dados..."
Comment.destroy_all
MovieCategory.destroy_all
Movie.destroy_all
Category.destroy_all
User.destroy_all

puts "👤 Criando usuário..."
user = User.create!(
  name: "Admin CineMind",
  email: "admin@cinemind.com",
  password: "123456",
  password_confirmation: "123456"
)

puts "📁 Criando categorias..."
categories = ["Ação", "Aventura", "Comédia", "Drama", "Ficção Científica", "Terror", "Romance", "Thriller", "Animação", "Fantasia"].map do |name|
  Category.create!(name: name)
end

puts "🎬 Criando filmes..."
[
  { title: "Matrix", synopsis: "Um hacker descobre que a realidade é uma simulação.", year: 1999, duration: 136, director: "Lana e Lilly Wachowski", categories: ["Ficção Científica", "Ação"] },
  { title: "A Origem", synopsis: "Ladrão que rouba segredos através de sonhos.", year: 2010, duration: 148, director: "Christopher Nolan", categories: ["Ficção Científica", "Thriller"] },
  { title: "Interestelar", synopsis: "Viagem espacial para salvar a humanidade.", year: 2014, duration: 169, director: "Christopher Nolan", categories: ["Ficção Científica", "Drama"] },
  { title: "O Poderoso Chefão", synopsis: "Saga de uma família do crime.", year: 1972, duration: 175, director: "Francis Ford Coppola", categories: ["Drama"] },
  { title: "Pulp Fiction", synopsis: "Histórias entrelaçadas do mundo do crime.", year: 1994, duration: 154, director: "Quentin Tarantino", categories: ["Drama", "Thriller"] },
  { title: "Vingadores: Ultimato", synopsis: "Heróis tentam reverter as ações de Thanos.", year: 2019, duration: 181, director: "Anthony e Joe Russo", categories: ["Ação", "Aventura"] }
].each do |data|
  movie = Movie.create!(
    title: data[:title],
    synopsis: data[:synopsis],
    year: data[:year],
    duration: data[:duration],
    director: data[:director],
    user: user
  )
  data[:categories].each do |cat_name|
    category = categories.find { |c| c.name == cat_name }
    movie.categories << category if category
  end
end

puts "💬 Criando comentários..."
Movie.all.each do |movie|
  Comment.create!(movie: movie, user: user, content: "Filme incrível! Recomendo!")
  Comment.create!(movie: movie, author_name: "João Silva", content: "Adorei, um dos melhores!")
end

puts "\n✅ Seeds criados!"
puts "📊 Total: #{User.count} usuários, #{Category.count} categorias, #{Movie.count} filmes, #{Comment.count} comentários"
puts "\n🔑 Login: admin@cinemind.com / 123456"
