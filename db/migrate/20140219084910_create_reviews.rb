class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :description
      t.integer :player_id
      t.integer :ranking
    end
  end
end
