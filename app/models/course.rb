class Course < ApplicationRecord
	has_many :users, through: :registrations
	has_many :registrations, class_name: "Registration",
							 foreign_key: "course_id",
							 dependent: :destroy

	def self.search(search)
	  where("lower(name) LIKE ? OR lower(description) LIKE ? OR lower(code) LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end
end
