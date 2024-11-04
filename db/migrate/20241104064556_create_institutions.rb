# frozen_string_literal: true

# CreateInstitutions Class
class CreateInstitutions < ActiveRecord::Migration[7.0]
    def change
        create_table :institutions do |t|
            t.string :uuid, null: false, default: -> { 'gen_random_uuid()' }
            t.boolean :active, default: true
            t.string :name
            t.string :address

            t.timestamps
        end

        add_index :institutions, :uuid, unique: true
    end
end
