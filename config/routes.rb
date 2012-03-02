Abundant::Application.routes.draw do
  devise_for :users
  
  match '/contacts/active_contacts' => "contacts#active_contacts"
  match '/contacts/dead_contacts' => "contacts#dead_contacts"
  match '/contacts/contact_active/:id' => "contacts#contact_active"
  match '/contacts/contact_dead/:id' => "contacts#acontact_dead"
  
  resources :rock_pad_variables, :next_actions, :pad_jobs, :statuses, :foundations, :pad_sizes, :trucks, :rock_pad_variables, :jobs, :contacts, :campaigns
  
  resources :jobs do
    member do
      get 'print'
    end
  end
  root :to => 'dashboard#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
end
