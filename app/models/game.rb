class Game < ActiveRecord::Base
  has_many :participating_users, :winners, :drafted_players
end
