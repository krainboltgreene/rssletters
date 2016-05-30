class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers, id: :uuid do |table|
      table.text :name, null: false
      table.text :href, null: false, default: ""

      table.timestamps null: false
    end
  end
end
