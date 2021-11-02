class Blog < ApplicationRecord
    validates :title, presence: true
    validates :body, presence: true
    has_many :comments, dependent: :destroy
    has_rich_text :body
    
end
