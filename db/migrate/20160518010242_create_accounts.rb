class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts, id: :uuid do |table|
      table.string :email, null: false, index: {unique: true}
      table.string :encrypted_password, null: false
      table.string :reset_password_token, index: true
      table.datetime :reset_password_sent_at
      table.datetime :remember_created_at
      table.string :confirmation_token, index: true
      table.datetime :confirmed_at
      table.datetime :confirmation_sent_at
      table.string :unconfirmed_email, index: true

      table.timestamps null: false, index: true
    end
  end
end
