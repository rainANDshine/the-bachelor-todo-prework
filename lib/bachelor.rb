#require "pry"
#require 'json'
#data = JSON.parse(File.read('spec/fixtures/contestants.json'))

def get_first_name_of_season_winner(data, season)
  winner = ""
  
  data.each do |season_num, contestants|
    if season_num == season
      contestants.each do |contestant|
        if contestant["status"] == "Winner"
          winner = contestant["name"].split(" ").first
        end
      end
    end
  end
  
  winner
end

def get_contestant_name(data, occupation)
  name = ""
  
  data.each do |season_num, contestants|
      contestants.each do |contestant|
        if contestant["occupation"] == occupation
          name = contestant["name"]
        end
      end
  end
  
  name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  
  data.each do |season_num, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
          count += 1
      end
    end
  end
  
  count
end

def get_occupation(data, hometown)
  data.each do |season_num, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  sum = 0
  count = 0
  
  data.each do |season_num, contestants|
    if season_num == season
      contestants.each do |contestant|
        sum += contestant["age"].to_f
        count += 1
      end
    end
  end
  
  (sum/count).round
end