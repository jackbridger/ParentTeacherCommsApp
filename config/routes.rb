Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
post 'signup' => 'devise/registrations#create', :as => :custom_user_registration

  root "home#index"

 resources :teacher

 resources :student
resources :english_grades
  resources :maths_grades


 resources :choose_subjects

end
