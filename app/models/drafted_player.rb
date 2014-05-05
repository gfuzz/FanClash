class DraftedPlayer < ActiveRecord::Base
	belongs_to :user, :game, :player
end
