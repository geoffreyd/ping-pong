class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.references  :player
      t.references  :match
      t.integer     :handicap
      t.integer     :round_1
      t.integer     :round_2
      t.integer     :round_3
      t.timestamps
    end
  end
  
  def self.down
    drop_table :games
  end
end
