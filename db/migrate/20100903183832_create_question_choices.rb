class CreateQuestionChoices < ActiveRecord::Migration
  def self.up
    create_table :question_choices do |t|
      t.string :text
      t.integer :question_id
      t.integer :votes_for
      t.timestamps
    end
  end

  def self.down
    drop_table :question_choices
  end
end
