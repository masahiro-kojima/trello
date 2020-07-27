class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
				# カードタイトル
      t.string :title, null: false, limit: 255
			# 	カード詳細
      t.text :memo, limit: 1000
		# 	誰が投稿したか	
      t.references :list, null: false, foreign_key: true

      t.timestamps
    end
  end
end

