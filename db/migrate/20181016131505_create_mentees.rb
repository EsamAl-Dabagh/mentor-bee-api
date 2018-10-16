class CreateMentees < ActiveRecord::Migration[5.2]
  def change
    create_table :mentees do |t|
      t.references :user, foreign_key: true
      t.string :bio
      t.string :interests

      t.timestamps
    end
  end
end
