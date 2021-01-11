Rails.application.routes.draw do
  root to: "desks#index"
  
  resources :desks
end
