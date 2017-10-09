# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course_file = File.read("./data/course.json")
course_list = JSON.parse(course_file)
if (Course.count==0)
  course_list.each do |x|
    Course.create({:name=>x["name"], :description=>x["description"],:code=>x["code"]})
  end
end


instructor_file = File.read("/Users/Andrea/Dropbox/cosi166b_ziyuqiu/RailsWorkspace/Course_Catalogs/Course_Data/instructor.json")
instructor_list = JSON.parse(instructor_file)
if (Instructor.count==0)
  instructor_list.each do |x|
    Instructor.create(x)
  end
end

subject_file = File.read("/Users/Andrea/Dropbox/cosi166b_ziyuqiu/RailsWorkspace/Course_Catalogs/Course_Data/subject.json")
subject_list = JSON.parse(subject_file)
if (Subject.count==0)
  subject_list.each do |x|
    x.delete("segments")
    print(x)
    Subject.create({:name=>x["name"], :abbreviation=>x["abbreviation"]})
  end
end

10.times do
  User.create(name: Faker::Name.name, email: Faker::Internet.email)
end

20.times do
  r = Registration.create(user_id: User.all.sample.id, course_id: Course.all.sample.id)
end