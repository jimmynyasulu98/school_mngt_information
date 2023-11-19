Rails.application.routes.draw do
  root to: "home#index"

  # student login home paths
  get 'students/index', to: 'students/homes#index' ,as: "students_index"
  get 'staff', to: 'staffs/home#index' ,as: "staffs_index"

end
