Rails.application.routes.draw do

  devise_for :staffs ,controllers: {
    sessions: 'staffs/sessions',
    #registrations: 'staffs/registrations',
    passwords: 'staffs/passwords'
  } # path: '/', path_names: { sign_up: 'register_staff' }

end
