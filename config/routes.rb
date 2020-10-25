Rails.application.routes.draw do

  devise_for :members, controllers: {
  sessions:      'members/sessions',
  passwords:     'members/passwords',
  registrations: 'members/registrations'
  }

  scope module: :members do
    root 'home#top'
    get 'home/top' => 'home#top'
    get 'about' => 'home#about', as: 'about'
    patch 'members/withdraw' => 'members#withdraw', as: 'members_withdraw'
    put 'members/withdraw' => 'members#withdraw'
    get 'search' => 'posts#search'
    resources :members, only: [:show, :edit, :update]
    resources :posts do
      resources :favorites, only: [:index, :create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
    resources :events, only: [:index]
    resources :relationships, only: [:create, :destroy]
  end

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
  }

  namespace :admins do
    get 'top' => 'home#top', as: 'top'
    resources :seasons, only: [:index, :create, :edit, :update, :destroy]
    resources :events
    resources :members, only: [:index, :show, :edit, :update]
  end

end
