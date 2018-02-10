Rails.application.routes.draw do
  resources :blogs
  resources :portfolio_items

  get 'about' => 'pages#about'
  get 'contact' => 'pages#contact'

  root to: 'pages#home'
end

# To search routes for a certain word
# ~ rake routes | grep keyword
