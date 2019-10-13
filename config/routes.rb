Rails.application.routes.draw do
  get 'comments/new'
  get 'workouts/new'
  get 'sessions/new'
  get 'users/new'
  get 'pages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  get 'pages/help'
  
  get    '/login',  to: 'sessions#new'     #ログインフォームを表示するページを取得
  post   '/login',  to: 'sessions#create'  #入力されたデータを元にSessionを作成
  delete '/logout', to: 'sessions#destroy' #Sessionを削除する
  
  resources :users
  resources :workouts
  resources :workouts do
    resources :comments
    #/workouts/:workout_id/comment/newのパスが使用できる
  end

  get    'likes/index' #投稿一覧ページ
  post   '/likes', to: 'likes#create'  #いいね作成
  delete '/likes', to: 'likes#destroy' #いいね解除
  
end
