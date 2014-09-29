class Conversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.belongs_to :user_a
      t.belongs_to :user_b
    end
  end
end
