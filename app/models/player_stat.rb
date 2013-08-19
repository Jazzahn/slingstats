class PlayerStat < ActiveRecord::Base
  include SimpleAPIFieldControl
  before_save :default_values

  def default_values
    self.rounds ||= 0
    self.roundswon ||= 0
    self.matches ||= 0
    self.matcheswon ||= 0
    self.goals ||= 0
    self.shootgoals ||= 0
    self.assists ||= 0
    self.throws ||= 0
    self.passes ||= 0
    self.turnovers ||= 0
    self.tackles ||= 0
    self.tacklesagst ||= 0
    self.selfpass ||= 0
  end

  def winning_ratio
    self.matches == 0 ? 0 : (self.matcheswon / self.matches.to_f) * 100
  end

  api_include :winning_ratio
end