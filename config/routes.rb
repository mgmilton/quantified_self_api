Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :foods do
        get '/', :to => "foods#index"
        get '/:id', :to => "foods#show"
        post '/', :to => "foods#create"
        patch '/:id', :to => "foods#update"
      end
    end
  end
end
