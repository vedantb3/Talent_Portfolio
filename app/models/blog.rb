class Blog < ApplicationRecord  
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  has_many :comments, dependent: :destroy
  has_rich_text :body
  has_one_attached :blogpic

  def blog_image
    blogpic.attachment.present? ? blogpic.variant(resize:"500x500") : "nature.png"
  end
end
