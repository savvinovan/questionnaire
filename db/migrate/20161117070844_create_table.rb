class CreateTable < ActiveRecord::Migration
  def change

    drop_table :questions
    drop_table :departments

    create_table :questions do |t|
      t.string :text

      t.timestamps
    end
    create_table :departments do |t|
      t.string :name

      t.timestamps
    end
  end
end
