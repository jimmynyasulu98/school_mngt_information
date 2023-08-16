
Rails.application.routes.draw do

  resources :subject, path: "subjects/new-subject" ,only: [:create ,:edit,:destroy],controller: "subjects/subjects"

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
