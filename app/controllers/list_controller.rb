class ListController < ApplicationController
# 　　モデル　見つける　id 
  before_action :set_list, only: %i(edit update destroy)

# リスト作成画面
  def new
    #  		モデル　作る
    @list = List.new
  end 

  def create
      # 　モデル　作る　
    @list = List.new(list_params)
# 　もし　モデル　保存
    if @list.save
# 　　行く　　　ルート
      redirect_to :root
# 保存失敗
    else
# 　　　リスト作成画面
      render action: :new
    end
  end

#  　編集
  def edit

  end
# 更新
  def update

#  もし　　　更新　　　　　　
    if @list.update_attributes(list_params)
# 　　リダイレクト　ルート
      redirect_to :root
# 　それ以外は
    else
        # 　アクション
      render action: :edit
    end
  end
# リスト消去
  def destroy
# 　　リスト消去
    @list.destroy
# 　　リスト一覧へ
    redirect_to :root
  end
  

  private
    def list_params
				# 	リストモデル　タイトル　　　　　誰がリストを作成したか
      params.require(:list).permit(:title).merge(user: current_user)
    end
# モデル　見つける　id
    def set_list
# 			モデル　見つける　id
      @list = List.find_by(id: params[:id])
    end

end
