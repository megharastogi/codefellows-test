class CreateAdmissionRequestsOfferings < ActiveRecord::Migration
  def change
    create_table :admission_requests_offerings,:id => false do |t|
    	t.integer :admission_request_id
    	t.integer :offering_id
    end
  end
end
