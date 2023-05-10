class CreateCompany < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :country_of_origin
      t.boolean :active
      t.integer :years_in_operation

      t.timestamps
    end
  end
end
