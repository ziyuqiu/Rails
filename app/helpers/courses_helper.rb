module CoursesHelper
	def current_course
		@current_course ||= Course.find_by(id: course[:course_id])
	end
end
