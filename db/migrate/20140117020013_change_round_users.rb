class ChangeRoundUsers < ActiveRecord::Migration
  def change
    change_table :round_users do |ru|
      ru.belongs_to :users
      ru.belongs_to :rounds
    end
  end
end
