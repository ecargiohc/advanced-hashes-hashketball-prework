require "pry"
def game_hash 
  {
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [ 
      {"Alan Anderson" => {
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1}}, 
      {"Reggie Evans" => 
        {:number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12, 
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7}}, 
      {"Brook Lopez" =>
        {:number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15}},
      {"Mason Plumlee" => 
        {:number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5}},
      {"Jason Terry" =>
        {:number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1}}]
  },
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {"Jeff Adrien" =>
        {:number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1, 
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2}},
      {"Bismack Biyombo" =>
        {:number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10}}, 
      {"DeSagna Diop" =>
        {:number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5}},
      {"Ben Gordon" =>
        {:number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0}},
      {"Kemba Walker" =>
        {:number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12}}]
  }
}
end

def num_points_scored(name)
    game_hash.each do |team, data|
      data.each do |key, value|
        if key == :players 
          value.each do |player_hash|
            if player_hash.keys[0] == name
              return player_hash.values[0].values_at(:points)[0]
            end
         end
      end
    end
  end
end

def shoe_size(name)
  game_hash.each do |team, data|
    data.each do |key, value|
      if key == :players 
        value.each do |player_hash|
          if player_hash.keys[0] == name
              return player_hash.values[0].values_at(:shoe)[0]
            end
          end
        end
      end
    end
end

def team_colors(name)
  game_hash.each do |team, data|
    if name == data[:team_name]
        data.each do |key, value|
          if key == :colors
            return value
          end
        end
      end
    end
end

def team_names
  teams = []
  game_hash.each do |team, data|
    teams << data[:team_name] 
  end
  return teams
end

def player_numbers(name)
  jersey = []
  game_hash.each do |team, data|
    if name == data[:team_name]
      data.each do |key, value|
        if key == :players
          value.each do |player|
          jersey << player.values[0].values_at(:number)
        end
      end
      end
    end
  end
  return jersey.flatten
end

def player_stats(player)
  player_data = nil
  game_hash.each do |team, data|
      data.each do |key, value|
        if key == :players
          value.each do |attributes|
            attributes.each do |name, name_data|
              if name == player
                player_data = name_data
            end
          end
        end
      end
    end
  end
  player_data
end

def big_shoe_rebounds
  big_feet = 0
  feet_rebounds = 0
  game_hash.each do |team, data|
    data.each do |key, value|
      if key == :players
        value.each do |attributes|
          attributes.each do |player, player_data|
            if player_data[:shoe] > big_feet
              big_feet = player_data[:shoe]
              feet_rebounds = player_data[:rebounds]
            end
          end
        end
      end
    end
  end
  feet_rebounds
end

def most_points_scored
  most_points = 0
  strong_player = ""
  game_hash.each do |team, data|
    data.each do |key, value|
      if key == :players
        value.each do |attributes|
          attributes.each do |player, player_data|
            if player_data[:points] > most_points
              most_points = player_data[:points]
              strong_player = player
            end
          end
        end
      end
    end
  end
  strong_player
end 

def winning_team 
  home_points = []
  away_points = []
  home = "Brooklyn Nets"
  away = "Charlotte Hornets"
  game_hash.each do |team, data|
    if team == :home
    data.each do |key, value|
      if key == :players
        value.each do |attributes|
          attributes.each do |player, player_data|
            home_points << player_data[:points]
        end
      end
    end
  end
    elsif team == :away
      data.each do |key, value|
        if key == :players
          value.each do |attributes|
            attributes.each do |player, player_data|
              away_points << player_data[:points]
            end
          end
        end
      end
    end
  end
  if home_points.reduce(:+) > away_points.reduce(:+)
      home
    else 
      away
    end
end

def player_with_longest_name   
  long_name = 0
  long_named = ""
  game_hash.each do |team, data|
    data.each do |key, value|
      if key == :players
        value.each do |attributes|
          attributes.each do |player, player_data|
            if player.length > long_name
              long_name = player.length
              long_named = player
            end
          end
        end
      end
    end
  end
  long_named
end

def long_name_steals_a_ton?
  most_steals = 0
  stealer = ""
   game_hash.each do |team, data|
    data.each do |key, value|
      if key == :players
        value.each do |attributes|
          attributes.each do |player, player_data|
            if player_data[:steals] > most_steals
              most_steals = player_data[:steals]
              stealer = player
          end
        end
      end
    end
  end
    if player_with_longest_name == stealer
      return true
    else 
      false
    end
  end
end