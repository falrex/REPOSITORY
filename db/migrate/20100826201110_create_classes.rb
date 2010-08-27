class CreateClasses < ActiveRecord::Migration
  def self.up
    create_table :classes do |t|
      t.column :section, :string
      t.column :time, :string
      t.column :day, :string
      t.column :subject_id ,:integer
      t.timestamps
    end
  end

  def self.down
    drop_table :classes
  end
end
