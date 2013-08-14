class AddFirebaseTokenToEstimates < ActiveRecord::Migration
  def change
    add_column :estimates, :firebase_token, :string

  end
end
