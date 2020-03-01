class AddUserToAds < ActiveRecord::Migration[6.0]
  def change
    add_reference :ads, :user, foreign_key: true
  end
end
