Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/dungeons", to: "dungeons#index"
  get "/dungeons/new", to: "dungeons#new"
  post "/dungeons", to: "dungeons#create"
  get "/dungeons/:id", to: "dungeons#show"
  get "/dungeons/:id/edit", to: "dungeons#edit"
  patch "/dungeons/:id", to: "dungeons#update"
  delete "/dungeons/:id", to: "dungeons#destroy"
  get "/dungeons/:dungeon_id/monsters", to: "dungeon_monsters#index"
  get "/dungeons/:dungeon_id/monsters/new", to: "dungeon_monsters#new"
  post "/dungeons/:dungeon_id/monsters", to: "dungeon_monsters#create"
  get "/dungeons/:dungeon_id/monsters/alphabetize", to: "dungeon_monsters#alphabetize"
  get "/monsters", to: "monsters#index"
  get "/monsters/new", to: "monsters#new"
  post "/monsters", to: "monsters#create"
  get "/monsters/:id", to: "monsters#show"
  get "monsters/:id/edit", to: "monsters#edit"
  patch "/monsters/:id", to: "monsters#update"
  delete "/monsters/:id", to: "monsters#destroy"
end
