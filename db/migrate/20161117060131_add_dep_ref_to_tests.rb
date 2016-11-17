class AddDepRefToTests < ActiveRecord::Migration
  def change
    add_foreign_key :tests, :department
  end
end
