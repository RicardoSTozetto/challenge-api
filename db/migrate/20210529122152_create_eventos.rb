class CreateEventos < ActiveRecord::Migration[6.1]
  def change
    create_table :eventos do |t|
      t.string :name

      t.timestamps
    end
  end
end
