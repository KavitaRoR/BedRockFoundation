class AddColorsToCrews < ActiveRecord::Migration
  def change
    add_column :crews, :background_color, :string

    add_column :crews, :border_color, :string

    add_column :crews, :text_color, :string

  end
end
