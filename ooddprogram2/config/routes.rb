Rails.application.routes.draw do
  resources :searches
  get 'sessions/new'

  # get 'static_pages/home'

  get  '/help', to: 'static_pages#help'
  get '/signup', to: 'users#new'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :interests
  resources :inquiries
  resources :houses
  resources :hunters
  resources :companies
  resources :users
  resources :search

  root 'static_pages#home'
  #Hancheng modifies/add realtors' routes

  #Hancheng modifies/add realtors' routes
  resources :realtors do
    member do
      get 'home'
      get 'listhouse'
      get 'editmyhouses'
      get 'viewallhouses'
      get 'editmycompany'
      get 'viewbuyers'
      get 'viewreplyinquiries'
    end
  end


  put 'realtors/:id/editmycompany' => 'realtors#updatemycompany'
  put 'realtors/:id/listhouse' => 'realtors#inserthouse'
  get 'realtors/:id/editmyhouses/:house_id', to: 'realtors#edithouse'
  get 'realtors/:id/deletemyhouses/:house_id', to: 'realtors#deletehouse'
  put 'realtors/:id/editmyhouses/:house_id', to: 'realtors#updatehouse'
  get 'realtors/:id/showhousepic/:house_id', to: 'realtors#showhousepic'
  get 'realtors/:id/addhousepic/:house_id', to: 'realtors#addhousepic'
  put 'realtors/:id/addhousepic/:house_id', to: 'realtors#inserthousepic'
  get 'realtors/:id/create_company', to: 'realtors#new_company'
  put 'realtors/:id/create_company', to: 'realtors#create_company'

  get 'realtors/:id/InquiryRespond/:inquiry_id', to: 'realtors#new_reply'
  put 'realtors/:id/InquiryRespond/:inquiry_id', to: 'realtors#create_reply'



  #Hancheng modification ends


  #prachi modification

  resources :hunters do
    member do
      get 'home'
      get 'addinquiry'
      get 'viewhouses'
      get 'viewcompany'
      get 'viewinterest'
      get 'viewinquiry'
      get 'showhousepic'
      get 'search'
    end

  end

  get 'interests/create_from_hunter/:hunter_id/:house_id', to: 'interests#createfromhunter'
  get 'searches/addinterest/:hunter_id/:house_id', to: 'searches#addinterest'
  get 'hunters/:id/showhousepic/:house_id', to: 'hunters#showhousepic'

  # put 'inquiries/add_from_hunter/:hunter_id/:house_id', to: 'inquiries#addfromhunter'
  put 'hunters/:id/addinquiry/:house_id', to: 'inquiries#addfromhunter'
  #prachi modification end
end
