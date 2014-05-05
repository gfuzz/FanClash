class Game < ActiveRecord::Base
  has_many :participating_users
  has_many :winners
  has_many :drafted_players
end
