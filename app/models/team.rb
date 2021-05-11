class Team < ApplicationRecord
    belongs_to :project_id, class_name: "Proj"
    belongs_to :user_id, class_name: "User"
end
