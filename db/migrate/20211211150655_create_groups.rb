class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :nombre
      t.integer :participantes
      t.date :fecha_debut
      t.string :personalidad

      t.timestamps
    end
  end
end
