class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :department_id
      t.integer :user_id
      t.integer :question_id
      t.integer :score
      t.text :text

      t.timestamps null: false
    end
  end
end
