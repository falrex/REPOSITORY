class CreateClasslists < ActiveRecord::Migration
  def self.up
    create_table :classlists do |t|
      t.column :class_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :classlists
  end
end
