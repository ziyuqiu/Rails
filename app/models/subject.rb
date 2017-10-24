class Subject < ApplicationRecord
	has_many :courses, through: :academic
end
