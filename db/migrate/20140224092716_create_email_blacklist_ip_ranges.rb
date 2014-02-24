class CreateEmailBlacklistIpRanges < ActiveRecord::Migration
  def change
    create_table :email_blacklist_ip_ranges do |t|
      t.string :value
      t.string :notes

      t.timestamps
    end
    add_index :email_blacklist_ip_ranges, :value, unique: true
  end
end
