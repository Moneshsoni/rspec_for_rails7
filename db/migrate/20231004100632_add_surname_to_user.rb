class AddSurnameToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :surname, :string
  end
end
