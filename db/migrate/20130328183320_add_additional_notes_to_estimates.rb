class AddAdditionalNotesToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :additional_notes, :text

  end
end
