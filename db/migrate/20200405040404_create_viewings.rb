class CreateViewings < ActiveRecord::Migration[6.0]
  def change
    create_table :viewings do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :show, null: false, foreign_key: true
      t.datetime :date
      t.string :location

      t.timestamps
    end
  end
end
