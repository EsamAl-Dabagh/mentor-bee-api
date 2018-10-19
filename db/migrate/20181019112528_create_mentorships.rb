class CreateMentorships < ActiveRecord::Migration[5.2]
  def change
    create_table :mentorships do |t|
      t.references :mentor, foreign_key: true
      t.references :mentee, foreign_key: true

      t.timestamps
    end
  end
end
