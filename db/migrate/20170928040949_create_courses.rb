class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :description
      t.string :code

      t.timestamps
    end
  end
end
