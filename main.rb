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

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  params.delete("captures")
  params[:date_joined] = Time.current
  user = User.new(params)
  if user.save
    redirect '/sign_in'
  else
    redirect '/'
  end
end

get '/sign_in' do
  erb :index
end

post '/sign_in' do
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    session[:user] = user
  end
  redirect '/'
end