Rails.application.routes.draw do
  resource :signin, only: [ :new, :create ]
  resource :session, only: [ :new, :destroy ] do
    get "/:token/create" => "sessions#create", as: :create
  end
end
