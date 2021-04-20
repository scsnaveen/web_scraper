class AddLinkColToPostDetails < ActiveRecord::Migration[6.0]
  def change
  	add_column :post_details,:link_value,:string,array:true, default: []
  	rename_column :post_details,:posts_id ,:post_id
  	remove_column :post_details,:title,:string
  	add_column :post_details,:title,:string, array: true, default: []
  end
end
