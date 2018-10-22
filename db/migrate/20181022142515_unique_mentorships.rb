class UniqueMentorships < ActiveRecord::Migration[5.2]
  def change
    add_index :mentorships, [:mentor_id, :mentee_id], unique: true
  end
end
