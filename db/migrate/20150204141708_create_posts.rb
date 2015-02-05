class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.integer :total_like
      t.integer :total_comment

      t.timestamps
    end
  end
end
