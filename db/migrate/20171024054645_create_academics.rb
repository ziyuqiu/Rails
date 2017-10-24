class CreateAcademics < ActiveRecord::Migration[5.1]
  def change
    create_table :academics do |t|
      t.integer :course_id
      t.string :subject_num

      t.timestamps
    end
  end
end
