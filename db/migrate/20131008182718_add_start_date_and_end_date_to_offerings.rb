class AddStartDateAndEndDateToOfferings < ActiveRecord::Migration
  def change
  	add_column :offerings , :start_date , :date
  	add_column :offerings , :end_date , :date
  end
end
