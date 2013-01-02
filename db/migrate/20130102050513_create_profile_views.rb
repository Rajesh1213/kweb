class CreateProfileViews < ActiveRecord::Migration
  def change
    create_table :profile_views do |t|
      t.integer :profile_id
      t.integer :user_id
      t.date :view_date

      t.timestamps
    end
  end
end
