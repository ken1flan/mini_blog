# frozen_string_literal: true

class CreateIdentities < ActiveRecord::Migration[5.1]
  def change
    create_table :identities do |t|
      t.integer :user_id, null: false
      t.string :provider, limit: 64, null: false
      t.string :uid, limit: 64, null: false

      t.timestamps
    end

    add_index :identities, :user_id
    add_index :identities, %i[provider uid], unique: true
  end
end
