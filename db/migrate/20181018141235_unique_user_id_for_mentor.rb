class UniqueUserIdForMentor < ActiveRecord::Migration[5.2]
  def change
    remove_index :mentors, :user_id
    add_index :mentors, :user_id, unique: true
  end
end
