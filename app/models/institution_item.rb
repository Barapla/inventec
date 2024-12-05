class InstitutionItem < ApplicationRecord
  belongs_to :item
  belongs_to :institution 

  has_many :movements
end
