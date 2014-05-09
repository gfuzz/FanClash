class Game < ActiveRecord::Base
  has_many :participating_users
  has_many :winners
  has_many :drafted_players

  def entries
  	current_entries.to_s + "/" + allowed_entries.to_s
  end

  def number_to_currency(number)
  	"$" + number.to_s
  end

  def add_entry
  	if self.current_entries < self.allowed_entries
  		self.current_entries += 1
  	end
  	self.save
  end
end
