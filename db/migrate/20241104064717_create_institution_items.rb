# frozen_string_literal: true

# CreateInstitutionItems Class
class CreateInstitutionItems < ActiveRecord::Migration[7.0]
    def change
        create_table :institution_items do |t|
            t.string :uuid, null: false, default: -> { 'gen_random_uuid()' }
            t.boolean :active, default: true
            t.references :item, null: false, foreign_key: true
            t.references :institution, null: false, foreign_key: true
            t.integer :amount

            t.timestamps
        end

        add_index :institution_items, :uuid, unique: true
    end
end
