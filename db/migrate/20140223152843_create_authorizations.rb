class CreateAuthorizations < ActiveRecord::Migration
  def change
    #create_table :authorizations, id: :uuid do |t|
    create_table :authorizations do |t|
      t.string :provider
      t.uuid :user_id
      t.string :uid
      t.timestamps
    end
    add_index :authorizations, :user_id
  end
end
