Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations" }

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :users do
        member do
          put "deactivate"
          put "remove_tag"
          put "add_tag"
        end
      end
      resources :tags
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
