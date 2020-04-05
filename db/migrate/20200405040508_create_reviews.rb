class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.belongs_to :viewing, null: false, foreign_key: true
      t.string :body
      t.integer :rating

      t.timestamps
    end
  end
end
