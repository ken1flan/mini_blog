# frozen_string_literal: true

class AddStatusToBlog < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :status, :int, null: false, default: 0
  end
end
