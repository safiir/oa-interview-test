class Student < ApplicationRecord
  has_many :followings
  has_many :teachers, through: :followings

  def cached_following_teachers
    Rails.cache.fetch([self, "following_teachers"]) do
      self.following_teachers
    end
  end
end
