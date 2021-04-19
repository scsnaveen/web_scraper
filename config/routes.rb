Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :admins
  devise_for :users, controllers: { 
		registrations: 'users/registrations', 
		sessions: 'users/sessions'
	}
  get 'welcome/index'
  root 'welcome#index'
  get 'posts/new'
  post 'posts/create'
  resources :posts,only: [:scrape] do
    match '/scrape', to: 'posts#scrape', via: :post, on: :collection
  end
  devise_scope :admin do
		get 'admins/sign_out', to: 'admins/sessions#destroy'
	end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
