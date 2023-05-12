class CreateSourceFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :source_files do |t|
      t.string :name
      t.string :file_name

      t.timestamps
    end
  end
end
