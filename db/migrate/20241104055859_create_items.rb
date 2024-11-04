# frozen_string_literal: true

# CreateItems Class
class CreateItems < ActiveRecord::Migration[7.0]
    def change
        create_table :items do |t|
            t.string :uuid, null: false, default: -> { 'gen_random_uuid()' }
            t.boolean :active, default: true
            t.string :name
            t.text :description
            t.integer :item_type
            t.references :category, null: false, foreign_key: true

            t.timestamps
        end

        add_index :items, :uuid, unique: true
    end
end
