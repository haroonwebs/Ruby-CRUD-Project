class CreateStudents < ActiveRecord::Migration[7.2]
  def change
    create_table :students do |t|
      t.string :fname
      t.string :lname
      t.string :age

      t.timestamps
    end
  end
end
