# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :nickname, limit: 64, null: false
      t.string :icon_url
      t.text :introduction

      t.timestamps
    end
  end
end
