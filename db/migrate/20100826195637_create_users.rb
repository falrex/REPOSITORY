class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :username, :string
      t.column :password, :string
      t.column :fname, :string
      t.column :lname, :string
      t.column :type, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
