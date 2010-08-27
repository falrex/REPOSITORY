class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.column :question, :string
      t.column :answer, :string
      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
