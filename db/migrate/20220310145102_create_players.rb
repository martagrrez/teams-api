class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :name
      t.float :price

      t.belongs_to :team, foreign_key: true

      t.timestamps
    end
  end
end
