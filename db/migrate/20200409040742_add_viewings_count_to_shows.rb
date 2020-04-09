class AddViewingsCountToShows < ActiveRecord::Migration[6.0]
  def change
    add_column :shows, :viewings_count, :integer
  end
end
