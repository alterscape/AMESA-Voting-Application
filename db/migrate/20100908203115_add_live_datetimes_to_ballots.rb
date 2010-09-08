class AddLiveDatetimesToBallots < ActiveRecord::Migration
  def self.up
    change_table :ballots do |t|
      t.datetime :start_date_time
      t.datetime :end_date_time
    end
  end

  def self.down
    change_table :ballots do |t|
      t.remove :start_date_time
      t.remove :end_date_time
    end
  end
end
