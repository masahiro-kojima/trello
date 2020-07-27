# 　　　コントローラ
class TopController < ApplicationController
# リスト表示
  def index
     # モデル　　　　　現在ユーザ　　並べる　 作成順
    @lists = List.where(user: current_user).order("created_at ASC")
  end
end