class CreateQualificationDetails < ActiveRecord::Migration
  def change
    create_table :qualification_details do |t|
      t.string :degree
      t.string :institute
      t.string :university
      t.string :course_name
      t.integer :year_of_passout
      t.date :from
      t.date :to
      t.integer :user_id

      t.timestamps
    end
  end
end
