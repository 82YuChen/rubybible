Rails.application.routes.draw do
  resources :events do
    collection do
      get :latest
      post :bulk_delete
      post :bulk_update
    end
    resources :attendees, :controller => 'event_attendees'
    resource :location, :controller => 'event_locations'
  end

  root "events#index"
end
