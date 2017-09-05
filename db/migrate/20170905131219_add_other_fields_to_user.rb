class AddOtherFieldsToUser < ActiveRecord::Migration
  
# rails g migration AddOtherFieldsToUser phone_number:string description:text
  def change
    add_column :users, :phone_number, :string
    add_column :users, :description, :text
  end
end
