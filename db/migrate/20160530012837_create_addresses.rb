class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses, id: :uuid do |table|
      table.text :name, null: false
      table.text :body, null: false
      table.uuid :account_id, null: false
      table.uuid :provider_id, null: false

      table.timestamps null: false
    end
  end
end
