class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links, id: :uuid do |table|
      table.text :href, null: false
      table.uuid :newsletter_id, null: false
      table.uuid :provider_id, null: false
      table.integer :position, null: false
      table.timestamp :read_at

      table.timestamps null: false
    end
  end
end
