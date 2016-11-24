class Deletescore < ActiveRecord::Migration
  def change
    remove_column :results, :score
  end
end
