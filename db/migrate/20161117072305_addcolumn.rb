class Addcolumn < ActiveRecord::Migration
  def changea
    add_column :department, :user_id, :integer
  end
end
