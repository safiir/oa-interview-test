class Teacher < ApplicationRecord
  has_many :followings
  has_many :students, through: :followings

  def cached_followed_students
    Rails.cache.fetch([self, "followed_students"]) do
      self.students
    end
  end
end
