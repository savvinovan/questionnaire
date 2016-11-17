class AddQuestionRefToTests < ActiveRecord::Migration
  def change
    add_foreign_key :tests, :question
  end
end
