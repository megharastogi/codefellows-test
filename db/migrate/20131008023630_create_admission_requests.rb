class CreateAdmissionRequests < ActiveRecord::Migration
  def change
    create_table :admission_requests do |t|
      t.integer :user_id
      t.text :why_join
      t.text :previous_programming_exp
      t.text :best_thing_ever
      t.text :find_about_cf
      t.text :phone_number

      t.timestamps
    end
  end
end
