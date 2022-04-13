Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create]

  #メッセージを投稿する際には、どのルームで投稿されたメッセージなのかをパスから判断できるようにしたいので、ルーティングのネストを利用します。
  #今回の場合、ネストをすることにより、roomsが親で、messagesが子という親子関係になるので、チャットルームに属しているメッセージという意味になります。
  #これによって、メッセージに結びつくルームのidの情報を含んだパスを、受け取れるようになります
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
