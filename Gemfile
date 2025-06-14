source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# Em vez disso, inclua o Rails edge: gem ‘rails’, github: ‘rails/rails’, branch: ‘main’
gem 'rails', '~> 6.1.7'
# Usei sqlite3 como banco de dados para Active Record
gem 'sqlite3', '~> 1.4'
# Usei Puma como servidor de aplicativos
gem 'puma', '~> 5.0'
# Usei SCSS para folhas de estilo
gem 'sass-rails', '>= 6'
# Transpile JavaScript semelhante a aplicativos. Leia mais: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# O Turbolinks torna a navegação em no aplicativo web mais rápida. Leia mais: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Criei APIs JSON: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Usei o adaptador Redis para executar o Action Cable em produção
# gem 'redis', '~> 4.0'
# Usei o Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Variante Active Storage
# gem 'image_processing', '~> 1.2'

# Reduz o tempo de inicialização por meio do cache, necessário em config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Chama ‘byebug’ em qualquer lugar do código para interromper a execução e obter um console de depuração
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
end

group :test do
  gem 'factory_bot_rails'
  gem 'shoulda-matchers'
end

group :development do
   # Acesse um console interativo em páginas de exceção ou chamando ‘console’ em qualquer lugar do código.
  gem 'web-console', '>= 4.1.0'
  # Exiba informações de desempenho, como tempo SQL e gráficos de chama para cada solicitação no seu navegador.
  # Pode ser configurado para funcionar também em produção, consulte: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # O Spring acelera o desenvolvimento, mantendo seu aplicativo em execução em segundo plano. Leia mais: https://github.com/rails/sprin
  gem 'spring'
end

# O Windows não inclui arquivos zoneinfo, portanto, inclua o gem tzinfo-data
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "devise", "~> 4.8"
