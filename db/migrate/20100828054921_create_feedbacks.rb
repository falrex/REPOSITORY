class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.column :user_id, :integer
      t.column :feedback, :string
      
      
      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
