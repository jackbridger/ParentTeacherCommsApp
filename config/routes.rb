Rails.application.routes.draw do

  resources :tasks
  resources :generated_feedbacks
  resources :maths_grades
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
post 'signup' => 'devise/registrations#create', :as => :custom_user_registration

devise_scope :user do
  root to: "devise/sessions#new"
end

 resources :teacher

 resources :student
resources :english_grades


 resources :choose_subjects
 resources :choose_feedback_generator

 resources :edit_auto_gens
end
