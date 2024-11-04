# frozen_string_literal: true

# CreateMovements Class
class CreateMovements < ActiveRecord::Migration[7.0]
    def change
        create_table :movements do |t|
            t.string :uuid, null: false, default: -> { 'gen_random_uuid()' }
            t.boolean :active, default: true
            t.references :institution_item, null: false, foreign_key: true
            t.references :user, null: false, foreign_key: true
            t.integer :movement_type
            t.integer :status
            t.integer :amount
            t.references :employee, null: true, foreign_key: true
            t.references :institution, null: true, foreign_key: true

            t.timestamps
        end

        add_index :movements, :uuid, unique: true
    end
end
