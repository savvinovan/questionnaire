class DropTable < ActiveRecord::Migration
  def down
    drop_table :questions
    drop_table :deparments
  end
end
