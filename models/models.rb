require 'bcrypt'
require 'sinatra/activerecord'
class User < ActiveRecord::Base
  has_secure_password
	validates_presence_of :password, :on => :create
  has_and_belongs_to_many :skills
  has_many :conversations
  has_many :messages
end

class Skill < ActiveRecord::Base
  has_and_belongs_to_many :users
end

class Conversation < ActiveRecord::Base
  has_many :messages
  belongs_to :user_a, class_name: "User"
  belongs_to :user_b, class_name: "User"
end

class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation
end
