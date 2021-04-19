class CreatePostDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :post_details do |t|
    	t.references :posts,null: false ,foreign_key: true
    	t.string :title

      t.timestamps
    end
  end
end
