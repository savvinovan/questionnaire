class CreateDepartmentsQuestions < ActiveRecord::Migration
  def change
    create_table :departments_questions do |t|
      t.belongs_to :department, index:true
      t.belongs_to :question, index:true
    end
  end
  def down
    drop_table :tests
  end
end
