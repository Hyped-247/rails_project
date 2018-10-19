class User < ActiveRecord::Base
  has_many :comments
  has_many :articles

  validates :username, presence: true,
            uniqueness: {case_sensitive: false,
                         message: "'%{value}' is already taken by another user" },
            length: {minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 105 },
            uniqueness: {case_sensitive: false },
              format: {with: VALID_EMAIL_REGEX }


end
