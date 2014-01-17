class Round < ActiveRecord::Base
  has_many :round_users
  has_many :users, :through => :round_users
end
