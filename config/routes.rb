Rails.application.routes.draw do
  resources :posts
    collection do
      post 'confirm'
    end
end
