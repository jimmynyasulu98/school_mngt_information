Rails.application.routes.draw do

  resources :subjects do
    get 'assessments', to: 'assessments/staff_assessments#assign_scores_to_students' ,as: "assign_scores_to_student"
    post 'assessment', to: 'assessments/staff_assessments#create_student_assessment_score' ,as: "student_assessment_score"
    resources :assessments, only: [ :new,:create, :show], controller: "assessments/staff_assessments"
  end

end
