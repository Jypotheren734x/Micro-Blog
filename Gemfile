source 'https://rubygems.org'
ruby '2.4.0'

gem 'activerecord' # ORM
gem 'rake' # interaction with DB
gem 'sinatra' # framework
gem 'sinatra-activerecord' # hooks orm to sinatra
gem 'bootstrap', '~> 4.0.0.alpha6'
gem 'bcrypt'

group :production do
  gem "pg"
end

group :development, :test do
  gem "sqlite3"
end