Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cocktails, only: [ :show, :create ] do
        collection do
          get :search
        end
      end
    end
  end

end
