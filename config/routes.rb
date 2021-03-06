Rails.application.routes.draw do
  resources :my_portfolios, except: [:show]
  get 'portfolio/:id', to: 'my_portfolios#show', as: 'portfolio_show'

  get 'about-me', to: "pages#about"
  get 'contact', to: "pages#contact"

  resources :blogs

  root to: "pages#home"
end
