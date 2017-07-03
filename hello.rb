require 'sinatra'
require 'sinatra/activerecord'
require './models'
require './config/environments'

enable :sessions
ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'postgres://egxuymljkrmkde:2ae62d8dd5520103286b31a5955ef12f576f235adf4588091dd72a7f04b34905@ec2-107-22-162-158.compute-1.amazonaws.com:5432/dffe37v92mjfrd')

get '/' do
  @posts = Post.last_ten("date_created")
  erb :index
end

get '/games' do
  @games = Game.order(title: :asc)
  erb :games
end

post '/games' do
  create = Game.new(title: params[:title], genre: params[:genre], players: params[:players], violence_rating: params[:violence_rating], description: params[:description], rating: params[:rated], img: params[:img])
  create.save
  redirect '/games'
end

get '/new_post' do
  erb :new_post
end

post '/new_post' do
  post = Post.new(title: params[:title], content: params[:content], user_id: session[:user].id, date_created: Time.current)
  User.find_by(id: session[:user].id).update(number_of_posts: session[:user].number_of_posts + 1)
  session[:user] = User.find_by(id: session[:user].id)
  if post.save
    redirect '/profile'
  else
    redirect '/new_post'
  end
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

post '/profile' do
  User.find_by(id: session[:user].id).update(name: params[:name]) unless params[:name] == ""
  User.find_by(id: session[:user].id).update(username: params[:username]) unless params[:username] == ""
  User.find_by(id: session[:user].id).update(email: params[:email]) unless params[:email] == ""
  User.find_by(id: session[:user].id).update(age: params[:age]) unless params[:age] == ""
  session[:user] = User.find_by(id: session[:user].id)
  redirect '/profile'
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do
  params.delete("captures")
  params[:date_joined] = Time.current
  params[:number_of_posts] = 0
  params[:rating] = 0
  params[:number_of_posts] = 0
  params[:visibility] = 111_111
  user = User.new(params)
  if user.save
    session[:user] = user
    redirect '/sign_in'
  else
    redirect '/sign_up'
  end
end

get '/sign_in' do
  user = User.find_by(username: params[:username])
  session[:user] = user if user && user.authenticate(params[:password])
  redirect '/'
end

post '/sign_in' do
  user = User.find_by(username: params[:username])
  session[:user] = user if user && user.authenticate(params[:password])
  redirect '/'
end

get '/sign_out' do
  session[:user] = nil
  redirect '/'
end

get '/search_results' do
  if !params[:querry].nil?
    @users = User.where('username LIKE ?', '%' + params[:querry] +'%').all
    @results = Post.where('content LIKE ?', '%' + params[:querry] +'%').all
    @results += Post.where('title LIKE ?', '%' + params[:querry] +'%').all
    @users.each do |user|
      @results += Post.where(user_id: user.id)
    end
  end
  erb :search_results
end

get '/all' do
  erb :all
end

get '/post' do
  @post = Post.find(params[:id])
end