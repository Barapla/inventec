class Employee < ApplicationRecord
  has_many :movements, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
end
