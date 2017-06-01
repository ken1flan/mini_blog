class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname, limit: 64, null: false
      t.string :icon_url
      t.string :text

      t.timestamps
    end
  end
end
