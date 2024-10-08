class Article < ApplicationRecord
    belongs_to :user, optional: true
    
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: { minimum: 3 }
    validates :text, presence: true, length: { minimum: 10 }

end
