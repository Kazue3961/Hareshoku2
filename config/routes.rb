Rails.application.routes.draw do

  devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
  }

  root'home#top'
  get 'home/top' => 'home#top'
  get 'home/about' => 'home#about'
  resources :members, only: [:show, :edit, :update]
  resources :posts
  resources :favorites, only: [:index, :create, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  resources :events, only: [:index]


  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  namespace :admins do
    root 'home#top'
    get 'home/top' => 'home#top'
    resources :seasons, only: [:index, :create, :edit, :update, :destroy]
    resources :events
    resources :members, only: [:index, :show, :edit, :update]
  end

end
