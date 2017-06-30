require 'sinatra'
require 'sinatra/activerecord'
require './models'

enable :sessions
set :database, 'sqlite3:blog.sqlite3'

get '/' do
  erb :index
end