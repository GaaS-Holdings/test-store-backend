class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :tagline
      t.string :desktop_image
      t.string :tablet_image
      t.string :mobile_image
    end
  end
end
