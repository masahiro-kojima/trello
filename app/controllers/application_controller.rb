# 　　　全コントローラ
class ApplicationController < ActionController::Base
# 　　セキュリティ
   protect_from_forgery with: :exception
# アクション実行前					サインインしていないならサインインページにリダイレクト
  before_action :authenticate_user!
# アクション実行前　　　ストロングパラメータ　　　もし　デバイスコントローラを使う時
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
        #  ストロングパラメータ
    def configure_permitted_parameters
							# 		許可　　サインアップの時　　名前ƒ
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
								# 	許可　　　アカウントアップデートの時　名前
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

end