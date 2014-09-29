class PrivMsgs < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.belongs_to :conversation
      t.belongs_to :user
      t.string :data
      t.timestamp
    end
  end
end
