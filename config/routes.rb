Challenge::Application.routes.draw do
  devise_for :users

  root :to => "home#index"

  resources :games do

    member do
      get  :join_form
      post :join
      delete :quit
    end

  end

end
