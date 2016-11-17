class AddTests < ActiveRecord::Migration
  def up
    create_table :tests
    add_column :tests, :question_id, :integer
    add_column :tests, :deparment_id, :integer
  end
end
