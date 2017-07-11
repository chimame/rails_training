Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, shallow: true do
    resources :rental_histories
  end

  namespace :api do
    resources :books
  end

  scope '/admin' do
    resources :rental_histories
  end
end
