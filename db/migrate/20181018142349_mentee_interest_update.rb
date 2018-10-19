class MenteeInterestUpdate < ActiveRecord::Migration[5.2]
  def change
    rename_column :mentees, :interests, :interest
  end
end
