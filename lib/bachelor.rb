require 'pry'

def get_first_name_of_season_winner(data, season)
  data.each do |season_data, contestants| # hash
    if season == season_data
      contestants.each do |contestant| # array
        contestant.each do |attribute, value| # hash
          if attribute == "status"
            if value == "Winner"
              return contestant["name"].split[0]
            end
          end
        end
      end
    end
  end
end


def get_contestant_name(data, occupation)
  data.each do |season_data, contestants| # hash
    contestants.each do |contestant| # array
      contestant.each do |attribute, value| # hash
        if attribute == "occupation"
          if value == occupation
            return contestant["name"]
          end
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_data, contestants| # hash
    contestants.each do |contestant| # array
      contestant.each do |attribute, value| # hash
        if attribute == "hometown"
          if value == hometown
            count += 1
          end
        end
      end
    end
  end
  count
end

def get_occupation(data, hometown)
  data.each do |season_data, contestants| # hash
    contestants.each do |contestant| # array
      contestant.each do |attribute, value| # hash
        if attribute == "hometown"
          if value == hometown
            return contestant["occupation"]
          end
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)
  age_array = []
  data.each do |season_data, contestants| # hash
    if season == season_data
      contestants.each do |contestant| # array
        contestant.each do |attribute, value| # hash
          if attribute == "age"
            age_array << value
          end
        end
      end
    end
  end
  num_arr = age_array.map(&:to_i)
  (num_arr.inject(0.0) {|sum, el| sum + el} / num_arr.size).round
end
