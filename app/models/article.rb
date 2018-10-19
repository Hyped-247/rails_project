class Article < ActiveRecord::Base
  belongs_to :user

  before_save {self.email = email.downcase}

  validates :title, presence: true, length: {minimum: 3, maximum: 300}
  validates :description, presence: true, length: {minimum: 3, maximum: 99}
  validates :user_id, presence: true
end

