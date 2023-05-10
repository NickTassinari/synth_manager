class CreateSynths < ActiveRecord::Migration[7.0]
  def change
    create_table :synths do |t|
      t.string :name
      t.boolean :polyphony
      t.integer :number_of_voices
      t.string :production_years

      t.timestamps
    end
  end
end
