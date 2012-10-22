MyRemainder::Application.routes.draw do

  resources :characters

  resources :tasks do
    resources :reminders
  end
  
  root :to => 'home#index'

  match "remainders/new/:id"=>"remainder#new"
  match "tasks/logout"=>"tasks#logout"
  match "tasks/selesai_task/:id"=>"tasks#selesai_task"
  match "tasks/belum_task/:id"=>"tasks#belum_task"

  #all get
  get "home/index"
  get "home/daftar_member"
  get "home/gagal_login"
  get "home/:id" => "home#cek_login"
  get "home2/index"


  #all post
  post "home/cek_login"=>"home#cek_login"
  post "home/gagal_login"=>"home#gagal_login"
 
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
