class User < ActiveRecord::Base
  has_many :posts
  has_many :users, through: :user_friends
  has_many :user_friends
  has_many :user_games
  has_many :games, through: :user_games
  has_secure_password
end

class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  belongs_to :user
end

class Post < ActiveRecord::Base
  belongs_to :user
end

class User_friend < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end

class User_game < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
end