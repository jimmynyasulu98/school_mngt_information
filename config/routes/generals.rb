Rails.application.routes.draw do

  resources :academic_year, path: "generals/academic_year",only: [:new , :create , :edit, :update, :destroy],controller: "generals/academic_year"
  resources :form ,only: [:new , :create , :edit]
  resources :form ,only: [:new , :create , :edit]
  resources :subject ,only: [:new , :create , :edit]

end
