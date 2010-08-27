class CreateChoices < ActiveRecord::Migration
  def self.up
    create_table :choices do |t|
      t.column :value, :string
      t.column :question_id, :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :choices
  end
end
