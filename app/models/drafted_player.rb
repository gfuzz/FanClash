class DraftedPlayer < ActiveRecord::Base
	belongs_to :game
	belongs_to :player
	has_many :draft_picks
end
