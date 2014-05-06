class DraftPick < ActiveRecord::Base
	belongs_to :user
	belongs_to :drafted_player
end
