Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/dungeons", to: "dungeons#index"
  get "/dungeons/new", to: "dungeons#new"
  post "/dungeons", to: "dungeons#create"
  get "/dungeons/:id", to: "dungeons#show"
  get '/dungeons/:id/edit', to: 'dungeons#edit'
  patch '/dungeons/:id', to: 'dungeons#update'
  delete 'dungeons/:id', to: 'dungeons#destroy'
end
