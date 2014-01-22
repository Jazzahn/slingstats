class PlayerStat < ActiveRecord::Base
  include SimpleAPIFieldControl

  def winning_ratio
    self.matches == 0 ? 0 : (self.matcheswon / self.matches.to_f) * 100
  end

  api_include :winning_ratio
end