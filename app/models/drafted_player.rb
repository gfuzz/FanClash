class DraftedPlayer < ActiveRecord::Base
	belongs_to :user
	belongs_to :game
	belongs_to :player
end
