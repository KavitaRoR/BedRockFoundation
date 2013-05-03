class CreateLibraryFiles < ActiveRecord::Migration
  def change
    create_table :library_files do |t|
      t.integer :job_id
      t.string :library_file

      t.timestamps
    end
  end
end
