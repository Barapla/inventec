class Movement < ApplicationRecord
  belongs_to :institution_item
  belongs_to :user
  belongs_to :employee
  belongs_to :institution
  # Podemos agregar un has_one through para acceder directamente al item
  has_one :item, through: :institution_item

  enum movement_type: ['Entrada', 'Salida']

  enum status: ['Pendiente', 'Aprobado', 'Rechazado']
end
