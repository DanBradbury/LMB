class CreateSearch < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
    end
  end
end
