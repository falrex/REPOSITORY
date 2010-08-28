class CreateSections < ActiveRecord::Migration
  def self.up
    create_table :sections do |t|
      t.column :section, :string
      t.column :time, :string
      t.column :day, :string
      t.column :subject_id ,:integer
      t.timestamps
    end
  end

  def self.down
    drop_table :sections
  end
end
