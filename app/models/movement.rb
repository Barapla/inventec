class Movement < ApplicationRecord
  belongs_to :institution_item
  belongs_to :user
  belongs_to :employee
  belongs_to :institution

  enum movement_type: ['Entrada', 'Salida']

  enum status: ['Pendiente', 'Aprobado', 'Rechazado']
end
