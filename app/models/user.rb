class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable

  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable
  validates :fullname, presence: true
  has_many :entities, foreign_key: 'author_id', dependent: :destroy
  has_many :categories
  has_many :groups, through: :entities
  has_one_attached :profile_picture
end
