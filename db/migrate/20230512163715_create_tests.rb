class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.integer :source_file_id
      t.integer :user_id

      t.timestamps
    end
  end
end
