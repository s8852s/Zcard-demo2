Rails.application.routes.draw do
  root "boards#index"
  resources :boards

  resource :users, controller: "registrations", only: [:create, :edit, :update] do
    get '/sign_up', action: "new"
  end
end
