class Movement < ApplicationRecord
  belongs_to :institution_item
  belongs_to :user
  belongs_to :employee
  belongs_to :institution
end
