class User < ActiveRecord::Base
  has_many :opinions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :profile_photo, ProfilePhotoUploader

  def admin?
    role == "admin"
  end

  def has_opinion?(matchup_id)
    if opinions.find_by matchup_id: matchup_id
      return true
    end
  end
end
