Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :foods do
        get '/', :to => "foods#index"
        get '/:id', :to => "foods#show"
        post '/', :to => "foods#create"
        patch '/:id', :to => "foods#update"
        delete '/:id', :to => "foods#destroy"
      end

      namespace :meals do
        get "/", :to => "meals#index"
        get '/:id/foods', :to => "meals#show"
        post '/:meal_id/foods/:id', :to => "meals#create"
        delete '/:meal_id/foods/:id', :to => "meals#destroy"
      end
    end
  end
end
