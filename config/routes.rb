Accessible::Decision::Tree::Engine.routes.draw do
  resources :trees, only: [:show] do
    resources :options, only: [:show]
  end
end
