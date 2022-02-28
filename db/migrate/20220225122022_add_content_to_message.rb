class AddContentToMessage < ActiveRecord::Migration[7.0]
  def change
    add_column :messages, :content, :string
  end
end
