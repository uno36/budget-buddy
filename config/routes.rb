Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
}
  root 'splash#index'
  resources :categories do
  end
end
