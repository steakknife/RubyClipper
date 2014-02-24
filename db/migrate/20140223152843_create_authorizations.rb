class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations, id: :uuid do |t|
      t.string :provider
      t.string :uid
      t.uuid :user_id
      t.timestamps
    end
    add_index :authorizations, :user_id
  end
end
