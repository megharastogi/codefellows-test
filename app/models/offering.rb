class Offering < ActiveRecord::Base
	  has_and_belongs_to_many :admission_requests

end
