class AddTypeToPost < ActiveRecord::Migration
  def change
    add_column :posts, :post_type, :integer
    add_column :posts, :content_type, :integer
    add_column :posts, :status, :integer
  end
end
