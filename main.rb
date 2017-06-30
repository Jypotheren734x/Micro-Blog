require 'sinatra'
require 'sinatra/activerecord'
require './models'

enable :sessions
set :database, 'sqlite3:blog.sqlite3'

get '/' do
  erb :index
end

get '/games' do
  erb :games
end

get '/popular' do
  erb :popular
end

get '/trending' do
  erb :trending
end

get '/profile' do
  erb :profile
end