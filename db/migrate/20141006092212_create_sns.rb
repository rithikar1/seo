class CreateSns < ActiveRecord::Migration
  def change
    create_table :sns do |t|
      t.string :p_name
      t.string :p_age
      t.string :p_dofv
      t.string :p_dolv
      t.string :p_regno
      t.string :p_record

      t.timestamps
    end
  end
end
