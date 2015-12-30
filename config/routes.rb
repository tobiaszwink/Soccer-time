Rails.application.routes.draw do
  resources :schedules
  resources :schools

  get '/:school' => 'schools#search_school'
end
