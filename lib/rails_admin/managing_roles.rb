module RailsAdmin
  module Config
    module Actions
      class ManagingRoles < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :collection do
          true
        end

        register_instance_option :http_methods do
          [:get]
        end

        register_instance_option :controller do
          proc do
            @limit = RolePermit.first.role_limit
            @posts = Post.where("id <=?",@limit) 
          end
        end

      end
    end
  end
end