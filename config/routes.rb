Rails.application.routes.draw do
  constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        resources :posts, only: [:index, :create]
        resources :rates, only: [:create]
        resources :authors, only: [:index]
      end
    end
  end
end
