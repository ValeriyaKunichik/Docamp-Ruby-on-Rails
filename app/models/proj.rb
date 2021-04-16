class Proj < ApplicationRecord
    belongs_to :user
    has_many :users
    default_scope -> { order('created_at DESC') }
    validates :name, presence: true
    validates :description, presence: true, length: { maximum: 150 }
end
