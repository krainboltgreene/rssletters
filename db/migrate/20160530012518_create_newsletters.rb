class CreateNewsletters < ActiveRecord::Migration
  def change
    create_table :newsletters, id: :uuid do |table|
      table.text :state, null: false, default: "fresh"
      table.text :body, null: false
      table.text :raw, null: false
      table.hstore :headers, null: false, default: {}
      table.jsonb :metadata, null: false, default: {}
      table.uuid :provider_id, null: false
      table.uuid :address_id, null: false
      table.uuid :account_id, null: false
      table.timestamp :parsed_at
      table.timestamp :read_at

      table.timestamps null: false
    end
  end
end
