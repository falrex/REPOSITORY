class CreateStudentrecords < ActiveRecord::Migration
  def self.up
    create_table :studentrecords do |t|
      t.column :quiz_id, :integer
      t.column :user_id, :integer
      t.column :grade, :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :studentrecords
  end
end
