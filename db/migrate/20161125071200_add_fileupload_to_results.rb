class AddFileuploadToResults < ActiveRecord::Migration
  def change
    add_attachment :results, :attachment
  end
end
