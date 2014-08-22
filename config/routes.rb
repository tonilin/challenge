Challenge::Application.routes.draw do
  devise_for :users, controllers: {:omniauth_callbacks => "users/omniauth_callbacks"}, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :create],
      path: 'users',
      path_names: { new: 'sign_up' },
      controller: 'devise/registrations',
      as: :user_registration do
        get :cancel
      end
  end
  root :to => "home#index"

  resources :games do

    member do
      get  :join_form
      post :join
      delete :quit
      get :complete_form
      post :complete
      get :choose_winner
      patch :choose
    end

  end

end
