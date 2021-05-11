class Proj < ApplicationRecord
    belongs_to :user
    #has_many :proj_user, through: :teams, source: :users
    #has_many :teams, foreign_key: "project_id", dependent: :destroy
    default_scope -> { order('created_at DESC') }
    validates :name, presence: true
    validates :description, presence: true, length: { maximum: 150 }
end
