class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  
  def name
    "#{first_name} #{last_name}"
  end

  def role
    roles.first.present? ? roles.first.name : "No Role"
  end

  def admin?
    has_role?(:admin)
  end

end
