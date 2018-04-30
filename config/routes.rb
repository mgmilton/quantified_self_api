Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :foods do
        get '/', :to => "foods#index"
        get '/:id', :to => "foods#show"
      end
    end
  end
end
