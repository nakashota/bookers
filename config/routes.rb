Rails.application.routes.draw do
  root to: 'books#top'
  
  resources :books

 # get  'books' => 'books#index'

  #get 'books/:id' => 'books#show'
  #post 'books' => 'books#create'

  #get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  
  #delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  #get 'books/new'
  patch 'books/:id' => 'books#update', as: 'update_book'
end
