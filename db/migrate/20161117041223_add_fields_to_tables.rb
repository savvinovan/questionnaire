class AddFieldsToTables < ActiveRecord::Migration
  def change
    add_column :departments, :name, :string
    add_column :departments, :user_id, :integer
    add_column :questions, :text, :string
    add_column :tests, :department_id, :integer
    add_column :tests, :question_id, :integer
    add_column :tests, :source_id, :integer
  end
end
