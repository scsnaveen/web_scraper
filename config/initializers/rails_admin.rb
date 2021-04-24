require Rails.root.join('lib', 'rails_admin' , 'bulk_update.rb')
require Rails.root.join('lib', 'rails_admin' , 'managing_roles.rb')

RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == CancanCan ==
  config.authorize_with :cancancan
  config.parent_controller = 'ApplicationController' 


  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
     bulk_update do
      only ['Post']
     end
  # config.included_models = ['User','Post']

    managing_roles do 
      visible do 
        bindings[:abstract_model].model.to_s == "Post"
      end
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
