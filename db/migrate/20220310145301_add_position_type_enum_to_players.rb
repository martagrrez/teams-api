class AddPositionTypeEnumToPlayers < ActiveRecord::Migration[7.0]
  def up
    execute <<-SQL.squish
      CREATE TYPE players_position
      AS ENUM (
        'goalkeeper',
        'defender',
        'midfielder',
        'forward'
      );
    SQL

    add_column :players, :position, :players_position
  end

  def down
    remove_column :players, :position, :players_position

    execute <<-SQL.squish
      DROP TYPE players_position_type;
    SQL
  end
end
