class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :language_name, :null => false, :default => ""
      t.integer :user_id, :null => false, :default => ""

      t.timestamps
    end

    add_index	:languages, :user_id
  end
end
