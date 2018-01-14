Rails.application.routes.draw do
  resources :blogs
  resources :portfolio_items

  get 'pages/home'
  get 'pages/about'
  get 'pages/contact'

end

# To search routes for a certain word
# ~ rake routes | grep keyword
