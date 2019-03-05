Rails.application.routes.draw do
  mount Accessible::Decision::Tree::Engine => "/accessible-decision-tree"
end
