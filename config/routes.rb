Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

     resources :students, only: [:index, :show, :create, :destroy]
     patch "/students/:id", to: "students#update", as: :student_update
    end
  end
end
