class User < ActiveRecord::Base
	has_many :games
	has_many :posts
	has_many :users, through: :user_friends
	has_many :user_friends
end

class Game < ActiveRecord::Base
	belongs_to :user
end

class Post < ActiveRecord::Base
	belongs_to :user
end

class User_friend < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, :class_name => 'User'
end
