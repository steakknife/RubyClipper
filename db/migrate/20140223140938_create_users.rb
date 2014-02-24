class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: false do |t|
      t.primary_key :id, :uuid, default: 'uuid_generate_v1()'
      t.string :name
      t.string :email
      t.timestamps
    end
    add_index :users, :email
  end
end
