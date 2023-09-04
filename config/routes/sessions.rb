Rails.application.routes.draw do

  devise_for :staff ,controllers: {
    sessions: 'staffs/sessions',
    #registrations: 'staffs/registrations',
    passwords: 'staffs/passwords'
  } # path: '/', path_names: { sign_up: 'register_staff' }

  devise_for :student ,controllers: {
    sessions: 'students/sessions',
    #registrations: 'staffs/registrations',
    passwords: 'students/passwords'
  } # path: '/', path_names: { sign_up: 'register_staff' }

end
