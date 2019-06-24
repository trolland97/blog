class Comment < ApplicationRecord
    belongs_to :post

    validates :name, presence: true
    validates :comment, presence: true
    validates :post_id, presence: true
end
