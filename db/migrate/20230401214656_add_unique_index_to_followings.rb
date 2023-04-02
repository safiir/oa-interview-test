class AddUniqueIndexToFollowings < ActiveRecord::Migration[6.1]
  def change
    add_index :followings, [:teacher_id, :student_id], unique: true
  end
end
