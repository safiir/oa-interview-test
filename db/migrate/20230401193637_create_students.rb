class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name, limit: 64, null: false
      t.text :bio, null: false
      t.string :gender, null: false

      t.timestamps
    end
  end
end
