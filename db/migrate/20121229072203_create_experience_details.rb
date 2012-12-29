class CreateExperienceDetails < ActiveRecord::Migration
  def change
    create_table :experience_details do |t|
      t.string :company_name
      t.string :company_url
      t.string :role
      t.datetime :from_date
      t.datetime :to_date
      t.integer :user_id

      t.timestamps
    end
  end
end
