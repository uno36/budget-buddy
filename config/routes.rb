Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
}
  root 'splash#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
