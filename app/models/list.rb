class List < ApplicationRecord
    # リストはユーザに属する
  belongs_to :user
        # 		リストタトル　長さ　1~255
 validates :title, length: { in: 1..255 }
# たくさん持てる　カード
  has_many :cards, dependent: :destroy

end
