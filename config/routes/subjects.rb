
Rails.application.routes.draw do

  resources :subject, path: "subjects/new-subject" ,only: [:create ,:edit,:destroy],controller: "subjects/subjects"

  resources :staffs do
    resources :subjects, only: [:new,:create, :show], controller: "subjects/staff_subjects"
  end


end
