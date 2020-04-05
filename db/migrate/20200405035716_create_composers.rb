class CreateComposers < ActiveRecord::Migration[6.0]
  def change
    create_table :composers do |t|
      t.string :name
      t.integer :birth_year
      t.integer :death_year
      t.string :country

      t.timestamps
    end
  end
end
