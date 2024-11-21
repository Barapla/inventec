class Item < ApplicationRecord
  belongs_to :category
  has_many :institution_items
  enum :item_type, [:insume, :tool]
  
  # Factory method para crear diferentes tipos de items
  def self.create_item(type, attributes = {})
    case type.to_sym
    when :insume
      InsumeItem.new(attributes)
    when :tool
      ToolItem.new(attributes)
    else
      raise ArgumentError, "Tipo de item desconocido: #{type}"
    end
  end

  def items_count
  institution_items.count
  end

  def translate_item_type
    if insume?
      "Insumo"
    else
      "Herramienta"
    end
  end
end