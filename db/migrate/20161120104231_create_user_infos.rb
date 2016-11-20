class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.string :department
      t.string :contact

      t.timestamps null: false
    end
  end
end
