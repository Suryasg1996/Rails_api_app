Rails.application.routes.draw do
  root 'buildings#index'

  resources :buildings do
    resources :floors do
      resources :rooms
    end
  end

end
