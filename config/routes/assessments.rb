Rails.application.routes.draw do

  resources :subjects do
    get 'assessments', to: 'assessments/staff_assessments#assign_scores_to_students' ,as: "assign_scores_to_student"
    post 'assessment', to: 'assessments/staff_assessments#create_student_assessment_score' ,as: "student_assessment_score"
    post 'submit_assessment/:id', to: 'assessments/staff_assessments#submit_assessment' ,as: "submit_assessment"
    resources :assessments, only: [ :new,:create, :show,:destroy], controller: "assessments/staff_assessments"
  end
  get 'assessments/mandatory_assessments', to: 'assessments/staff_assessments#mandatory_assessments' ,
    as: "mandatory_assessments"

  post 'assessments/mandatory_assessments', to: 'assessments/staff_assessments#create_mandatory_assessment' ,
  as: "mandatory_assessment"

end
