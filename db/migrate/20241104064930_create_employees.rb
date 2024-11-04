# frozen_string_literal: true

# CreateEmployees Class
class CreateEmployees < ActiveRecord::Migration[7.0]
    def change
        create_table :employees do |t|
            t.string :uuid, null: false, default: -> { 'gen_random_uuid()' }
            t.boolean :active, default: true
            t.string :first_name
            t.string :last_name
            t.string :employee_number

            t.timestamps
        end

        add_index :employees, :uuid, unique: true
    end
end
