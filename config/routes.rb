Rails.application.routes.draw do
  resources :events do
    resources :attendees, :controller => 'event_attendees'
  end
  resources :events do
    resource :location, :controller => 'event_locations'
  end
  root "events#index"
end
