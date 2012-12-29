class CreateExperienceDetails < ActiveRecord::Migration
  def change
    create_table :experience_details do |t|
      t.string :company_name, :null => false, :default => ""
      t.string :company_url, :null => false, :default => ""
      t.string :role, :null => false, :default => ""
      t.date :from_date
      t.date :to_date
      t.integer :user_id, :null => false, :default => ""

      t.timestamps
    end

    add_index :experience_details, :user_id
  end
end
