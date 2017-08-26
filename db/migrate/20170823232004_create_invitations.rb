class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :email, null: false, limit: 256
      t.text :message, null: false, limit: 256
      t.integer :introducer_id, null:false
      t.string :token, null:false
      t.datetime :expired_at, null:false

      t.timestamps
    end

    add_index :invitations, :introducer_id
  end
end
