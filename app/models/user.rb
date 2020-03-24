class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: JwtBlacklist
  acts_as_taggable
  acts_as_taggable_on :tags

  def self.search(search)
    if search
      puts "form model--------> #{search}"
      User.where("email ILIKE ? OR name ILIKE ?", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end
