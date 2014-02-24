class CreateEmailBlacklistDomains < ActiveRecord::Migration
  def change
    create_table :email_blacklist_domains do |t|
      t.string :value
      t.string :notes

      t.timestamps
    end
    add_index :email_blacklist_domains, :value, unique: true
  end
end
