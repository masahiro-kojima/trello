class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      # タイトル
      t.string :title, null: false
				# 	誰が投稿したか
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end