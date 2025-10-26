🎬 CineMind - Catálogo Inteligente de Filmes
<img width="1919" height="970" alt="image" src="https://github.com/user-attachments/assets/844afba1-2def-4138-9e5a-c2aaf30d6442" />
<img width="1917" height="906" alt="image" src="https://github.com/user-attachments/assets/cb99cf98-bd0b-4004-a39c-c839e9dc570d" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/6f1ff895-1973-406f-9c6e-19d8629f5fb0" />
<img width="1919" height="914" alt="image" src="https://github.com/user-attachments/assets/9f73e11f-f63b-48b5-ac30-b4c360f980e4" />
<img width="1917" height="908" alt="image" src="https://github.com/user-attachments/assets/08a5ee0d-5c2b-4d76-80d5-b1d396fcef41" />
<img width="1919" height="910" alt="image" src="https://github.com/user-attachments/assets/db8fb20d-86e3-4d96-ba75-f49f53bbe9b2" />
<img width="1901" height="907" alt="image" src="https://github.com/user-attachments/assets/3fe07794-478c-4ea0-b8da-8ebd0222c0a9" />
<img width="1897" height="902" alt="image" src="https://github.com/user-attachments/assets/ee228f86-7ad2-4b06-a7fb-1fdd91781c67" />
<img width="1900" height="909" alt="image" src="https://github.com/user-attachments/assets/31efd89d-89b5-45e1-81d8-886096378363" />
<img width="1899" height="905" alt="image" src="https://github.com/user-attachments/assets/74eaf00d-5ff2-4b32-8d3b-aed75a4231cb" />






Seu catálogo pessoal de filmes com busca por IA, importação em massa e interface estilo Netflix


📋 Sobre o Projeto
CineMind é uma aplicação web moderna para gerenciamento de catálogos de filmes, desenvolvida com Ruby on Rails. O projeto oferece uma experiência premium inspirada nas principais plataformas de streaming, com recursos avançados de IA e importação em massa.
✨ Destaques

🤖 Busca Inteligente com IA - Integração com OpenAI/Gemini para preenchimento automático
📤 Importação CSV em Lote - Processamento assíncrono com Sidekiq
🎨 Interface Moderna - Design inspirado em Netflix e Amazon Prime Video
🔐 Autenticação Completa - Sistema robusto com Devise
💬 Sistema de Comentários - Interação entre usuários
🏷️ Categorização - Organização por múltiplas categorias
📸 Upload de Imagens - Active Storage com preview


🚀 Funcionalidades
Core Features
✅ CRUD Completo de Filmes

Criar, ler, atualizar e deletar filmes
Validações robustas
Upload de posters com preview
Relacionamento muitos-para-muitos com categorias

✅ Autenticação e Autorização

Registro e login de usuários
Cada usuário gerencia seus próprios filmes
Proteção de rotas sensíveis

✅ Sistema de Comentários

Comentários aninhados por filme
Usuários autenticados podem comentar
Donos podem deletar comentários

Features Avançadas
🤖 Busca com IA

Integração com OpenAI GPT-3.5 Turbo
Preenchimento automático de título, sinopse, ano, duração e diretor
Fallback gracioso quando API não está configurada

📤 Importação CSV

Upload de arquivos CSV com drag & drop
Processamento em background com Sidekiq
Barra de progresso em tempo real
Notificação por email ao concluir
Tratamento robusto de erros

🎨 UI/UX Premium

Design dark mode inspirado em Netflix
Animações suaves e transições
Totalmente responsivo (mobile-first)
Cards com hover effects
Hero banners cinematográficos


🛠️ Tecnologias Utilizadas
Backend

Ruby 3.2.2
Rails 7.1+
PostgreSQL 16
Redis - Cache e filas
Sidekiq - Background jobs

Frontend

Tailwind CSS - Estilização
Stimulus - JavaScript framework
Turbo - SPA-like experience

Gems Principais
rubygem 'devise'              # Autenticação
gem 'sidekiq'             # Background jobs
gem 'redis'               # Cache store
gem 'kaminari'            # Paginação
gem 'ruby-openai'         # Integração OpenAI
gem 'image_processing'    # Processamento de imagens
gem 'aws-sdk-s3'          # Storage (produção)

📦 Instalação
Pré-requisitos

Ruby 3.2.2+
Rails 7.1+
PostgreSQL 16+
Redis 7+
Node.js 18+ (para assets)

Passo a Passo

Clone o repositório

bashgit clone https://github.com/seu-usuario/cinemind.git
cd cinemind

Instale as dependências

bashbundle install

Configure o banco de dados

bash# Crie o arquivo config/database.yml com suas credenciais
cp config/database.yml.example config/database.yml

# Crie e migre o banco
rails db:create
rails db:migrate
rails db:seed

Configure as variáveis de ambiente

bash# Crie o arquivo .env na raiz do projeto
cat > .env << EOF
OPENAI_API_KEY=sua_chave_openai_aqui
REDIS_URL=redis://localhost:6379/1
EOF

Inicie os serviços

Em terminais separados:
bash# Terminal 1: Redis
redis-server

# Terminal 2: Sidekiq
bundle exec sidekiq

# Terminal 3: Rails Server
rails server

Acesse a aplicação

http://localhost:3000

🔐 Configuração de API Keys
OpenAI (Busca com IA)

Acesse: https://platform.openai.com/api-keys
Crie uma nova API key
Adicione no .env:

bashOPENAI_API_KEY=sk-proj-...
Alternativa: Google Gemini
bash# Instale a gem
bundle add gemini-ai

# Configure no .env
GEMINI_API_KEY=AIza...

📤 Formato do CSV para Importação
O arquivo CSV deve seguir este formato:
csvtitle,synopsis,year,duration,director,categories
"Matrix","Um hacker descobre a realidade simulada",1999,136,"Wachowski Sisters","Ficção Científica,Ação"
"Inception","Ladrão invade sonhos",2010,148,"Christopher Nolan","Ficção Científica,Thriller"
Regras:

✅ Header obrigatório: title,synopsis,year,duration,director,categories
✅ Título é obrigatório
✅ Categorias separadas por vírgula
✅ Campos com vírgula devem estar entre aspas
✅ Máximo 5MB por arquivo


🧪 Testes
bash# Rodar todos os testes
bundle exec rspec

# Com coverage
COVERAGE=true bundle exec rspec

# Testes específicos
bundle exec rspec spec/models
bundle exec rspec spec/controllers

🚀 Deploy
Render (Recomendado)

Crie um novo Web Service

Build Command: bundle install; rails assets:precompile; rails db:migrate
Start Command: bundle exec puma -C config/puma.rb


Configure o banco PostgreSQL

Adicione um PostgreSQL instance
Conecte ao Web Service


Adicione Redis

Adicione um Redis instance
Configure REDIS_URL


Variáveis de ambiente

bashRAILS_ENV=production
SECRET_KEY_BASE=seu_secret_key
OPENAI_API_KEY=sua_key
REDIS_URL=redis://...

Configure o Sidekiq

Crie um Background Worker
Start Command: bundle exec sidekiq


📁 Estrutura do Projeto
app/
├── controllers/
│   ├── movies_controller.rb         # CRUD de filmes
│   ├── comments_controller.rb       # Sistema de comentários
│   ├── ai_searches_controller.rb    # Busca IA
│   └── movie_imports_controller.rb  # Importação CSV
├── models/
│   ├── movie.rb                     # Model principal
│   ├── user.rb                      # Autenticação
│   ├── comment.rb                   # Comentários
│   ├── category.rb                  # Categorias
│   └── movie_import.rb              # Importações
├── jobs/
│   └── import_movies_job.rb         # Job de importação
├── services/
│   └── ai_movie_search_service.rb   # Service de IA
├── mailers/
│   └── import_mailer.rb             # Emails de importação
└── views/
    ├── movies/                       # Views de filmes
    ├── movie_imports/                # Views de importação
    └── devise/                       # Views de autenticação

🎯 Decisões Técnicas
Por que Sidekiq?

✅ Processamento assíncrono de CSVs grandes
✅ Evita timeouts em requisições HTTP
✅ Retry automático em caso de falhas
✅ Dashboard para monitoramento

Por que PostgreSQL?

✅ Relacionamentos complexos (many-to-many)
✅ Performance em queries com joins
✅ Suporte a full-text search (futuro)
✅ ACID compliance

Por que Tailwind CSS?

✅ Utility-first para desenvolvimento rápido
✅ Sem conflitos de classes CSS
✅ Tree-shaking em produção
✅ Responsivo por padrão


🐛 Troubleshooting
Sidekiq não processa jobs
bash# Verifique se o Redis está rodando
redis-cli ping
# Deve retornar: PONG

# Reinicie o Sidekiq
pkill -f sidekiq
bundle exec sidekiq
Erro ao fazer upload de imagens
bash# Verifique o Active Storage
rails active_storage:install
rails db:migrate
Busca IA não funciona
bash# Verifique a API key
echo $OPENAI_API_KEY

# Teste manualmente
rails console
> AiMovieSearchService.new("Matrix").call

📈 Roadmap Futuro

 Sistema de avaliações (rating)
 Listas personalizadas (watchlist)
 Busca avançada com filtros
 Integração com TMDB API
 PWA (Progressive Web App)
 Dark/Light mode toggle
 Internacionalização (I18n)
 GraphQL API
 Testes E2E com Cypress

👨‍💻 Autor
Cleane

GitHub: @vidalcleane
LinkedIn: www.linkedin.com/in/cleanevidal
Email: mcleanevidalf@gmail.com

📄 Licença
Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

🙏 Agradecimentos

Design inspirado em Netflix e Amazon Prime Video
OpenAI pela API de GPT-3.5
Comunidade Rails pelo suporte incrível


<div align="center">
  <strong>⭐ Se gostou do projeto, deixe uma estrela! ⭐</strong>
</div>


