
Rails.application.routes.draw do

  resources :subject, path: "subjects/new-subject" ,only: [:create ,:edit,:destroy],controller: "subjects/subjects"
  get '/subjects/subjects/add-subjects-to-class', to: 'subjects/subjects#add_subject_to_class', as: "add_subject_to_class"
  post '/subjects/subjects/add-subjects-to-class', to: 'subjects/subjects#create_class_subject', as: "create_subject_class"

  resources :staffs do
    resources :subjects, only: [:index, :new,:create, :show], controller: "subjects/staff_subjects"
  end

  # Path for registaring subjcets for students by a staff member
  post 'students/subjects/add-subjects-to-student', to: 'subjects/student_subjects#create' ,as: "register_subject_for_student"
  # Resource for registaring subjcets for students on thier own
  resources :students do
    resources :subjects, only: [:index, :new,:create, :show], controller: "students/staff_subjects"
  end

end
