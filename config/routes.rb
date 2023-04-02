Rails.application.routes.draw do
  resources :students do
    get :following_teachers, on: :member
  end

  resources :teachers do
    get :followed_students, on: :member
    post 'follow_student/:student_id', action: :follow_student, on: :member
    delete 'unfollow_student/:student_id', action: :unfollow_student, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
