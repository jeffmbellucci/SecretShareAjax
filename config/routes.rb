FirstAjaxProject::Application.routes.draw do
  root :to => "Users#new"

  resources :secrets, :only => :create
  resource :session
  resources :users do
    resources :secrets, :only => [:new]
  end
end
