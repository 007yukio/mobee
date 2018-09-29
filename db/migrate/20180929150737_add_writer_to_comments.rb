class AddWriterToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :writer, :text
  end
end
