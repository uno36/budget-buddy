Rails.application.routes.draw do
  get 'transactions/index'
  get 'categories/index'
  devise_for :users, controllers: {
  registrations: 'users/registrations',
  sessions: 'users/sessions'
}
  root 'splash#index'
  resources :categories do
    resources :transactions
  end
end
