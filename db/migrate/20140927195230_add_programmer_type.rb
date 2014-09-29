class AddProgrammerType < ActiveRecord::Migration
  def change
    add_column :users, :prog_type, :string 
  end
end
