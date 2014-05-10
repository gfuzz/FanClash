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

  def self.get_user_by_username(username)
    User.where(username: username)[0]
  end
end
