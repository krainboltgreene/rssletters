class ChangeRawFromTextToJsonbOnNewsletters < ActiveRecord::Migration
  def change
    remove_column :newsletters, :raw
    add_column :newsletters, :raw, :jsonb, null: false
  end
end
