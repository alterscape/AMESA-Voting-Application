class CreateBallotsVoters < ActiveRecord::Migration
  def self.up
    create_table :ballots_voters, :id => false do |t|
      t.integer :ballot_id
      t.integer :voter_id
     
      t.timestamps
    end
    
    add_index :ballots_voters, :ballot_id
    add_index :ballots_voters, :voter_id
  end

  def self.down
    drop_table :ballots_voters
  end
end
