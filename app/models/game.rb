require 'nokogiri'
require 'open-uri'

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

  # Gets our current users picks for the game
  def self.getUsersPicks(user_id, game_id)
    userPicks = []
    allUsersPicks = DraftPick.where(user_id: user_id)
    allUsersPicks.each do |pick|
      searchDraftedPlayer = DraftedPlayer.where(id: pick.drafted_player_id, game_id: game_id)[0]
      if searchDraftedPlayer != nil
        userPicks << Player.where(id: searchDraftedPlayer.player_id)[0]
      end
    end
    userPicks
  end

  # Gets all of the users in the game.
  def self.getAllUsersForGame(game_id)
    usersForGame = ParticipatingUser.where(game_id: game_id)
    userList = []
    usersForGame.each do |user|
      userList << User.where(id: user.user_id)[0]
    end
    userList
  end

  # Lists all the drafted players for a game.
  def self.getDraftedPlayers(game_id)
    allDraftedPlayers = DraftedPlayer.where(game_id: game_id)
    allDraftedPlayersSearch = []
    allDraftedPlayers.each do |player|
      allDraftedPlayersSearch << Player.where(id: player.player_id)[0]
    end
    allDraftedPlayersSearch
  end

  # Takes URL of each player, puts it in array, then takes out the duplicates.
  def self.getAllDraftedPlayersURL(game_id)
    allDraftedPlayers = DraftedPlayer.where(game_id: game_id)
    allDraftedPlayersURL = []
    allDraftedPlayers.each do |player|
      if player.player_url != nil
        allDraftedPlayersURL << player.player_url
      end
    end
    allDraftedPlayersURL.uniq!
  end

  # Scraps the data from each players URL and stores in an array.
  def self.scrapData(players_url)
    playerStatsData = []
    @scoreBoard = []
    scores = []
      players_url.each do |website|
        if website != ""
          doc = Nokogiri::HTML(open(website))
          playerStatsData << doc.css('.awayStats')
          playerStatsData << doc.css('.homeBoxScorePlayerStats')
          scores << doc.css('#mainScoreBoard')
        end
        scores.each do |score|
          array = []
          array << score.css('#awayScoreTile span').text[0..2]
          array << score.css('#awayScoreTile span').text[3..-1]
          array << score.css('#homeScoreTile span').text[0..2]
          array << score.css('#homeScoreTile span').text[3..-1]
          array << score.css('.sbTimeFinal').text
          @scoreBoard << array
        end
      end
    [playerStatsData] + [@scoreBoard]
  end

  # Scraps the data from each players URL and stores in an array.
  def self.scrapDataBaseball(players_url)
    playerStatsDataBaseball = []
    @scoreBoard = []
    scores = []
      players_url.each do |website|
        if website != ""
          doc = Nokogiri::HTML(open(website))
          playerStatsDataBaseball << doc.css('.away')
          playerStatsDataBaseball << doc.css('.home')
          scores << doc.css('.gtScoreboard')
        end
          scores.each do |score|
            array = []
            array << score.css('.awayTeam a').text
            array << score.css('.awayTeam .score').text
            array << score.css('.homeTeam a').text
            array << score.css('.homeTeam .score').text
            array << score.css('.gameStatus').text
            @scoreBoard << array
          end
      end
    [playerStatsDataBaseball] + [@scoreBoard]
  end

  # Sorts the data then puts it in the database.
  def self.sortScrapBaseball(draftedPlayerList, playerStatsData)
    draftedPlayerList.each do |playerObject|
      player = playerObject.player_name
      firstLetter = player[0]
      lastName = player.split(" ")[1]
      playerStatsArray = []

      if playerObject.position == "SP" || playerObject.position == "P" || playerObject.position == "RP"
        playerStatsData.each do |data|
          data.css(".pitchingStats").each do |x|
            if x.css("tr a").text.include?(lastName)
              # playerStatsArray.push(x.css("tr td")[0].text, x.css("tr td")[1].text, x.css("tr td")[2].text, x.css("tr td")[3].text, x.css("tr td")[4].text, x.css("tr td")[5].text, x.css("tr td")[6].text, x.css("tr td")[7].text, x.css("tr td")[8].text, x.css("tr td")[9].text, x.css("tr td")[10].text, x.css("tr td")[11].text, x.css("tr td")[12].text)

              strikeouts = x.css("tr td")[6].text.to_i
              hits = x.css("tr td")[3].text.to_i
              homeruns = x.css("tr td")[8].text.to_i

              fantasypoints = (strikeouts * 4) + (hits * -1) + (homeruns * -3)

              DraftedPlayer.where(:player_id => playerObject.id).update_all(:points => strikeouts , :rebounds => hits,
                :assists => homeruns, :fantasypoints => fantasypoints)
            end
          end
        end
      else
        playerStatsData.each do |data|
          data.css(".lineup tr").each do |x|
            if x.css("a").text.include?(lastName)
              # playerStatsArray.push(x.css("td")[0].text, x.css("td")[1].text, x.css("td")[2].text, x.css("td")[3].text, x.css("td")[4].text, x.css("td")[5].text, x.css("td")[6].text, x.css("td")[7].text, x.css("td")[8].text, x.css("td")[9].text, x.css("td")[10].text, x.css("td")[11].text, x.css("td")[12].text)

              homeruns = x.css("td")[7].text.to_i
              rbi = x.css("td")[4].text.to_i
              r = x.css("td")[2].text.to_i
              strikeouts = x.css("td")[6].text.to_i
              hits = x.css("td")[3].text.to_i

              fantasypoints = (homeruns * 10) + (rbi * 3) + (r * 3) + (strikeouts * -1) + (hits * 2)

              DraftedPlayer.where(:player_id => playerObject.id).update_all(:points => homeruns , :rebounds => rbi,
                :assists => r, :blocks => strikeouts, :steals => hits, :fantasypoints => fantasypoints)
            end
          end
        end
      end
    end
  end


  # Sorts the data then puts it in the database.
  def self.sortScrap(draftedPlayerList, playerStatsData)
    draftedPlayerList.each do |playerObject|
      player = playerObject.player_name
      firstLetter = player[0]
      lastName = player.split(" ")[1]
      playerStatsArray = []
      playerStatsData.each do |data|
        data.css("tr").each do |x|
          if x.css("a").text[0] == firstLetter &&  x.css("a").text.include?(lastName)
            playerStatsArray.push(x.css("td")[0].text, x.css("td")[1].text, x.css("td")[2].text, x.css("td")[3].text, x.css("td")[4].text, x.css("td")[5].text, x.css("td")[6].text, x.css("td")[7].text, x.css("td")[8].text, x.css("td")[9].text, x.css("td")[10].text, x.css("td")[11].text, x.css("td")[12].text)

            points = x.css("td")[1].text.to_i
            rebounds = x.css("td")[2].text.to_i
            assists = x.css("td")[3].text.to_i
            blocks = x.css("td")[10].text.to_i
            steals = x.css("td")[9].text.to_i
            turnovers = x.css("td")[8].text.to_i

            fantasypoints = points + (rebounds * 1.25) + (assists * 1.5) + (blocks * 2) + (steals * 2) + (turnovers * -1)

            DraftedPlayer.where(:player_id => playerObject.id).update_all(:points => points , :rebounds => rebounds,
              :assists => assists, :blocks => blocks, :steals => steals,
              :turnovers => turnovers, :fantasypoints => fantasypoints)
          end
        end
      end
    end
  end


  def self.checkGamesOver
    gamesOverValues = []
    gamesOver = false
    @scoreBoard.each do |game|
      if game[4] == "Final"
        gamesOverValues << true
      else
        gamesOverValues << false
      end
    end
    if gamesOverValues.uniq.size == 1
      if gamesOverValues.uniq[0] != false
        gamesOver = true
      end
    end
    gamesOver
  end

  def self.checkGamesOverBaseball
    gamesOverValues = []
    gamesOver = false
    @scoreBoard.each do |game|
      if game[4] == "Final"
        gamesOverValues << true
      else
        gamesOverValues << false
      end
    end
    if gamesOverValues.uniq.size == 1
      if gamesOverValues.uniq[0] != false
        gamesOver = true
      end
    end
    gamesOver
  end

  def self.getWinners(game_id)
    userscores = []

    # Gets all the users in a game.
    usersForGame = ParticipatingUser.where(game_id: game_id)
    theUsersCount = ParticipatingUser.where(game_id: game_id).count - 1
    numofWinners = theUsersCount / 2
    userList = []
    usersForGame.each do |user|
      userList << User.where(id: user.user_id)[0]
    end

    # Goes through each of the users picks. Adds up their players fantasy points and
    # gives the user a final score and puts in an array.
    userList.each do |user|
      allUsersPicks = DraftPick.where(user_id: user.id)
      fantasyScore = 0
      allUsersPicks.each do |pick|
        searchDraftedPlayer = DraftedPlayer.where(id: pick.drafted_player_id, game_id: game_id)[0]
        if searchDraftedPlayer != nil && searchDraftedPlayer.fantasypoints != nil
          fantasyScore += searchDraftedPlayer.fantasypoints
        end
      end
      userscores.push(:username => "#{user.username}", :score => fantasyScore)
    end
    userscores.sort_by! { |hsh| hsh[:score]}.reverse!
    lastPlaceScore = userscores[numofWinners]
    tiebreakerPeople = []
    userscores[numofWinners..-1].each do |score|
      if score[:score] == lastPlaceScore[:score]
        tiebreakerPeople << score
      end
    end
    tiePlayerPoints = DraftedPlayer.where(game_id: game_id)[10].fantasypoints
    tieWinner = [{:username => "", :tieGuess => 0, :difference => 99999999}]
    if tiebreakerPeople != []
      tiebreakerPeople.each do |score|
        person = User.where(username: score[:username])[0]
        tie_amount = ParticipatingUser.where(game_id: game_id, user_id: person.id)[0].tiebreaker
        diff = tiePlayerPoints > tie_amount ? tiePlayerPoints - tie_amount : tie_amount - tiePlayerPoints;
        if diff < tieWinner[0][:difference]
          tieWinner.delete_at(0)
          tieWinner.push({:username => "#{person.username}", :tieGuess => tie_amount, :difference => diff})
        end
      end
    end

    # if tieWinner != []
    #   userscores[numofWinners] = tieWinner
    if tieWinner != []
      userscores[numofWinners] = tieWinner[0]
    end
    userscores[0..numofWinners]
  end


  def self.rewardWinners(winners, game_id)
    game = Game.find(game_id)
    payout = game.buy_in.to_i * 2
    winners.each do |winner|
      user = User.where(username: winner[:username])[0]
      part_user = ParticipatingUser.where(user_id: user.id, game_id: game_id)[0]
      if part_user.paid_out == false
        user2 = User.where(username: winner[:username])[0]
        paid = user2.money.to_i + payout
        user2.money = paid
        part_user.paid_out = true
        user2.save
        part_user.save
      end
    end
  end

  def add_entry
  	if self.current_entries < self.allowed_entries
  		self.current_entries += 1
  	end
  	self.save
  end
end
