class AddUniqueIndexForNameOnProviders < ActiveRecord::Migration
  def change
    add_index :providers, :name, unique: true
  end
end
