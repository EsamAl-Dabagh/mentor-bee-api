class UniqueUserIdForMentee < ActiveRecord::Migration[5.2]
  def change
    remove_index :mentees, :user_id
    add_index :mentees, :user_id, unique: true
    rename_column :mentors, :skills, :skill
  end
end
