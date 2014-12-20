class CreateWorksites < ActiveRecord::Migration
  def change
    create_table :worksites do |t|
      t.decimal :latitude
      t.decimal :longitude
      t.string :address
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
