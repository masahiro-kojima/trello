class User < ApplicationRecord
  # 　複数リスト作成可能　ユーザ消したらリストも消す
  has_many :lists, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          # 検証　　　名前　　存在する　　　　長さ　　　　　20
  validates :name, presence: true, length: { maximum: 20 }
end
