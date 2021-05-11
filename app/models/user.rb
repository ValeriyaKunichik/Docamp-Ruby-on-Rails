class User < ApplicationRecord
  has_many :projs, dependent: :destroy
  #has_many :teams, foreign_key: "user_id", dependent: :destroy
  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end


  def is_proj_team(proj)
    teams.find_by(project_id: proj.id)
  end

  def add_to_proj_team(proj)
    teams.create!(project_id: proj.id)
  end

  def delete_from_team(proj)
    teams.find_by(project_id: proj.id).destroy
  end

  private

    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
