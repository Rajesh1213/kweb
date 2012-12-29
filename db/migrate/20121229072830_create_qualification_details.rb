class CreateQualificationDetails < ActiveRecord::Migration
  def change
    create_table :qualification_details do |t|
      t.string :degree, :null => false, :default => ""
      t.string :institute, :null => false, :default => ""
      t.string :university, :null => false, :default => ""
      t.string :course_name, :null => false, :default => ""
      t.integer :year_of_passout, :null => false, :default => ""
      t.date :from
      t.date :to
      t.integer :user_id, :null => false, :default => ""

      t.timestamps
    end

    add_index  :qualification_details, :degree
    add_index  :qualification_details, :university
    add_index  :qualification_details, :course_name
    add_index  :qualification_details, :year_of_passout
    add_index  :qualification_details, :user_id
  end
end
