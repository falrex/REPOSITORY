class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.column :name, :string
      t.column :date, :date
      t.column :subject_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :quizzes
  end
end
