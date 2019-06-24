class Post < ApplicationRecord
    belongs_to :user
    has_and_belongs_to_many :categories
    has_many :comments, dependent: :destroy

    validates :title, presence: true
    validates :content, presence: true
    validates :user_id, presence: true
end
