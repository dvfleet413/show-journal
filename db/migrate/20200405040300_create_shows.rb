class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
      t.belongs_to :composer, null: false, foreign_key: true
      t.belongs_to :genre, null: false, foreign_key: true
      t.string :title
      t.integer :first_performance_year

      t.timestamps
    end
  end
end
