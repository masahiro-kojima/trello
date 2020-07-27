Rails.application.routes.draw do
#  ルート
  root 'top#index'
#  サインアップサインインルーティング
  devise_for :users

        #コントローラ               アクション		
  resources :list, only: %i(new create edit update destroy) do
# 			/list/:list_id/card/new	
#             /list/:list_id/card
    resources :card, only: %i(new create show edit update destroy) do
    resources :card, except: %i(index)
    end
  end
end