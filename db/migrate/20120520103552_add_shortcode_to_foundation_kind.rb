class AddShortcodeToFoundationKind < ActiveRecord::Migration
  def change
    add_column :foundation_calculators, :shortcode, :string
    
  end
end
