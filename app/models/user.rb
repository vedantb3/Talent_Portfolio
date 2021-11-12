class User < ApplicationRecord
  after_create :welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :blogs

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :image, :dependent =>:destroy

  has_one_attached :image

  def user_image
    image.attachment.present? ? image.variant(resize:"75x75") : "nature.png"
  end

  def welcome_email
    UserMailer.welcome_email(self).deliver_now
  end
end
