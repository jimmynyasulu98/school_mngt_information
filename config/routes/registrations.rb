Rails.application.routes.draw do

  resources :staffs ,only: [:edit, :update, :destroy]
    get 'registrations/staffs', to: 'staffs/registrations#index' ,as: "staff-members"
    get 'registrations/staffs/register-staff', to: 'staffs/registrations#new' ,as: "register_staff"
    post 'registrations/staffs/register-staff', to: 'staffs/registrations#create' ,as: "staffs"


  resources :students ,only: [:edit, :update, :destroy]
    get 'registrations/students/register-student', to: 'students/registrations#new' ,as: "register_student"
    post 'registrations/students/register-student', to: 'students/registrations#create' ,as: "students"

  resources :students do
    resources :guardians ,only: [:new , :create , :edit],
    controller: "generals/guardians"
  end
  post 'registrations/guardian/guardian-type', to: 'generals/guardians#guardian_type' ,as: "guardian_type"




end
