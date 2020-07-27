# 　　カードタイトル、詳細、誰が投稿したか
class Card < ApplicationRecord
# 　　カードはリストに属する
  belongs_to :list
# 　タイトル　　長さ
  validates :title, length: { in: 1..255 }
# 　詳細　　長さ
  validates :memo,  length: { maximum: 1000 }
end