class User < ActiveRecord::Base
  has_many :opinions

  mount_uploader :profile_photo, ProfilePhotoUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == "admin"
  end

  def has_opinion?(matchup)
    opinions.find_by(matchup_id: matchup.id)
  end
end
