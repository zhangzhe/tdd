class AddLikeTimesToShow < ActiveRecord::Migration
  def change
    add_column :shows, :liked_count, :integer, default: 0
  end
end
