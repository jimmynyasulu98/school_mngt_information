Rails.application.routes.draw do

  resources :subjects do
    resources :assessments, only: [ :new,:create, :show], controller: "assessments/staff_assessments"
  end

end
