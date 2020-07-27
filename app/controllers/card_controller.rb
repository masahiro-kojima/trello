class CardController < ApplicationController

  def new
# 		カードタイトル、詳細、誰が投稿したか　作る
    @card = Card.new
# 　　リストタイトル　誰が投稿したか　見つける　id
    @list = List.find_by(id: params[:list_id])
  end

  def create
    #  カードタイトル、詳細、誰が投稿したか 作る　　カードタイトル、詳細、誰が投稿したか　取得
    @card = Card.new(card_params)
# 保存
    if @card.save
      redirect_to :root
# 失敗
    else
      render action: :new
    end
  end
# 　詳細
  def show
# カードタイトル、詳細、誰が投稿したか　見つける　id　
    @card = Card.find_by(id: params[:id])
  end

# カード編集
  def edit
# カードタイトル、詳細、誰が投稿したか	　見つける　id
    @card = Card.find_by(id: params[:id])
# リストタイトル　誰が投稿したか　user_idがcurretn_user.idと一致するレコードの情報を取得　　　　　
    @lists = List.where(user: current_user)

  end

# カード編集
  def update
# カードタイトル、詳細、誰が投稿したか　見つける　id
    @card = Card.find_by(id: params[:id])
#   カードタイトル、詳細、誰が投稿したか 更新　カードタイトル、詳細、誰が投稿したか
    if @card.update_attributes(card_params)
# カード一覧
      redirect_to :root

    else
   # カード編集
      render action: :edit
    end
  end
# カード削除
  def destroy
    @card = Card.find_by(id: params[:id])
# カードタイトル、詳細、誰が投稿したか　消去
    @card.destroy
    redirect_to :root
  end


  private
# カードタイトル、詳細、誰が投稿したか
    def card_params
								# 		カードタイトル、詳細、誰が投稿したか
      params.require(:card).permit(:title, :memo, :list_id)
    end
end