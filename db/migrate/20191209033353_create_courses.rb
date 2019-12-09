class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.integer :user_id
      t.datetime :starts_at
      t.datetime :ends_at
      t.boolean :message_sent
      t.string :professor
      t.string :location

      t.timestamps
    end
  end
end
