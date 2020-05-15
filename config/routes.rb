Rails.application.routes.draw do
  get 'config/index'

  root 'config#index'
end
