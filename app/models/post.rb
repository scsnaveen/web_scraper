class Post < ApplicationRecord
	# has_one :post_detail
	include AdminCurrent
		scope :id, -> {where("id <=?",RolePermit.where("role_base=?",AdminCurrent.admin_current.role).first.role_limit) } 

		RailsAdmin.config do |config|
  			config.model Post do
				list do
					scopes [:id] 
				end
				
			end
		end
		# rails_admin do
		# 	edit do
		# 		scopes [:id] 
		# 	end
		# end
end
