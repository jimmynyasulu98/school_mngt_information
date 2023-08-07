Rails.application.routes.draw do

  resources :academic_year, path: "generals/academic_year",
    only: [:new , :create , :edit, :update, :destroy], controller: "generals/academic_year"
  resources :terms, path: "generals/term",only: [:index, :new , :create , :edit],
     controller: "generals/terms"
  resources :form ,only: [:new , :create , :edit]

end
