class User < ActiveRecord::Base
  has_many :posts
  has_many :users, through: :user_friends
  has_many :user_friends
  has_many :user_games
  has_many :games, through: :user_games
  has_many :comments
  has_secure_password
end

class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  belongs_to :user
end

class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  def self.last_ten(column)
    self.order("#{column}": :desc).last(10)
  end
end

class UserFriend < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
end

class UserGame < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
end

class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user
  has_many :comments, through: :comment_sub_comments
  has_many :comment_sub_comments
end

class CommentSubComment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :sub_comment, :class_name => 'Comment'
end