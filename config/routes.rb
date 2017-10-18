Rails.application.routes.draw do
  resources :results
  resources :tests
  resources :answers
  resources :questions
  resources :coincidences
  resources :articles
  resources :animals
  resources :articlecats
  resources :animalcats
  #devise_for :users
  #resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users_admin, :controller => 'users'
 

 devise_for :users,controllers: { registrations: "registrations", sessions: "sessions"}

 #put '/users_admin/:id/edit' => 'users#update' ,:as => :users_edit

 patch 'users_admin/:id/edit' => 'users#update' , as: 'users_edit'

 get '/animalcats/:id/showAnimalsCat' => 'animalcats#showAnimalsCat', as: 'showAnimalsCat'
  
get '/articlecats/:id/showArticlesCat' => 'articlecats#showArticlesCat', as: 'showArticlesCat'

get '/articles/:id/articleRecommendation' => 'articles#articleRecommendation', as: 'articleRecommendation'

get '/orderQuestions' => 'questions#orderQuestions', as: 'orderQuestions'



# se agrega esta linea para que siempre lo mande al login cado no esté resgistrado
authenticated :user do
   root :to => "users#index"
 end
 root :to => redirect("/users/sign_in")
end
