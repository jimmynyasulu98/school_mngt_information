Rails.application.routes.draw do

  root "home#index"

  devise_for :staffs ,controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations',
    passwords: 'staffs/passwords'
  }# path: '/', path_names: { sign_up: 'register_staff' }

  resources :staffs ,only: [:edit, :update, :destroy]
    get 'staffs/register-staff', to: 'staffs/registrations#new' ,as: "register_staff"
    post 'staffs/register-staff', to: 'staffs/registrations#create' ,as: "staffs"

    #post 'submit_oder', to: 'order_items#submit_order' ,as: "submit_order"

  devise_for :students

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")

end
