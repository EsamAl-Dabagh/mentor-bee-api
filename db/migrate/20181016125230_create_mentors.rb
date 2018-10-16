class CreateMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :mentors do |t|
      t.references :user, foreign_key: true
      t.string :bio
      t.string :skills

      t.timestamps
    end
  end
end
