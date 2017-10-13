class Course < ApplicationRecord
	has_many :users, through: :registrations
	has_many :registrations, class_name: "Registration",
							 foreign_key: "course_id",
							 dependent: :destroy

	def self.search(search)
	  where("name LIKE ? OR description LIKE ? OR code LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%") 
	end
end
