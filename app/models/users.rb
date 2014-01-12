class Users < ActiveRecord::Base
  include SimpleAPIFieldControl

  def winning_round_ratio
    self.total_rounds == 0 ? 0 : ((self.rounds_won / self.total_rounds.to_f) * 100).round
  end

  api_include :winning_round_ratio
end