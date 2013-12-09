class AddUnlikedCountToShows < ActiveRecord::Migration
  def change
    add_column :shows, :unliked_count, :integer, :default => 0
  end
end
