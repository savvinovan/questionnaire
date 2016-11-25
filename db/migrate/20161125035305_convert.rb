class Convert < ActiveRecord::Migration
  def change
    change_column :questions, :name, :integer
  end
end
