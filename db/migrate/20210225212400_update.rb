class Update < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :desktop_image
    remove_column :products, :tablet_image
    remove_column :products, :mobile_image
    remove_column :description, :mobile_image
    add_column :products, :image, :string
    add_column :products, :featured, :boolean, default: true
  end
end
