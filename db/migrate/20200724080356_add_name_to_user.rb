class AddNameToUser < ActiveRecord::Migration[5.2]
  def change
      # カラム追加　テーブル　カラム　　　　　カラム
    add_column :users, :name, :string, null: false, default: ""
  end
end
