Rails.application.routes.draw do
  get 'students/subjects', to: 'students/homes#subjects' ,as: "student_subjects"
  get 'students/registration', to: 'students/homes#select_subjects' ,as: "student_registration"
  post 'students/registration', to: 'students/homes#register_subjects' ,as: "register_subjects"
  get 'students/assessments', to: 'students/homes#assessments' ,as: "student_assessments"
end
