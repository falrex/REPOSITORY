class CreatePublishquizzes < ActiveRecord::Migration
  def self.up
    create_table :publishquizzes do |t|
      t.column :question_id, :integer
      t.column :quiz_id, :integer
      
      t.timestamps
    end
  end

  def self.down
    drop_table :publishquizzes
  end
end
