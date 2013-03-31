Abundant::Application.routes.draw do
  WepayRails.routes(self)

  resources :foundation_calculators

  resources :job_additions

  resources :day_crew_blocks

  resources :arrival_ranges

  devise_for :users, :controllers => {:registrations => "users"}

  match '/contacts/active_contacts' => "contacts#active_contacts"
  match '/contacts/dead_contacts' => "contacts#dead_contacts"
  match '/contacts/contact_active/:id' => "contacts#contact_active"
  match '/contacts/contact_dead/:id' => "contacts#contact_dead"
  match '/contacts/destroy/:id' => "contacts#destroy"
  match '/estimates/email/:id/:type' => "estimates#email_estimate"
  match "/estimates/client_estimate/:token" => "estimates#client_estimate"
  match "/estimates/view_estimate/:token" => "estimates#view_estimate"
  match "/e/:token" => "estimates#client_estimate"
  match "/estimates/push_to_sold/:id/:type" => "estimates#push_to_sold"
  match "/estimates/off_level_to_show" => "estimates#off_level_to_show"
  post "/estimates/add_note" => "estimates#add_note"
  match "/estimates/view_notes/:token" => "estimates#view_notes"
  match "/users/create" => "users#create"
  match "/schedule/(:action)" => "schedule"
  match 'jobs/foreman_print_modal/(:id)' => 'jobs#foreman_print_modal'
  match "/users/become/(:id)" => 'users#become'
  namespace :purchase do
    match "/finalize" => 'finalize#index'
  end

  resources :rock_pad_variables, :next_actions, :pad_jobs, :statuses, :foundations, :pad_sizes, :trucks, :rock_pad_variables, :jobs, :contacts, :campaigns, :locations, :schedule, :shed_companies, :crews, :content_data, :crew_dashboard, :users
  
  resources :jobs do
    member do
      get 'print'
      get 'print_modal'
    end
  end
  
  root :to => 'passthrough#index'

  match ':controller(/:action(/:id))(.:format)'
end
