class ParticipatingUser < ActiveRecord::Base
	belongs_to :user, :game
end
