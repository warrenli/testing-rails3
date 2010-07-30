TestingRails3::Application.routes.draw do
  resources :contacts, :except => [:show, :edit, :update, :destroy]

  root :to => "contacts#new"
end

