class User < ApplicationRecord
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :email
  has_many :posts
  has_many :comments
  has_many :locations, through: :posts
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  enum role: %i[default admin]

  def top_three_locations
    locations.joins(:country)
             .group('countries.name')
             .order('count_country_id DESC')
             .count(:country_id)
             .first(3)
             .to_h
  end
end
