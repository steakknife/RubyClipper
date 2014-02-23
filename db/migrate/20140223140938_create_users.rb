class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.primary_key :id, :uuid, default: 'uuid_generate_v1()'
      t.string :name
      t.string :email
      t.string :provider
      t.string :uid
      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :uid
  end
end
