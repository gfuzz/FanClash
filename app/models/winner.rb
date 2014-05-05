class Winner < ActiveRecord::Base
	belongs_to :user, :game
end
