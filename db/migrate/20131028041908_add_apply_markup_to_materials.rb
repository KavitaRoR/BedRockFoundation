class AddApplyMarkupToMaterials < ActiveRecord::Migration
  def change
    add_column :materials, :apply_markup, :boolean, :default => true

  end
end
