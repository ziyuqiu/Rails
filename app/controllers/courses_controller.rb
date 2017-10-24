class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    course_file = File.read("#{Rails.root}/db/data/course.json")
    course_list = JSON.parse(course_file)
    if (Course.count==0)
      course_list.each do |x|
        c = Course.create({:name=>x["name"], :description=>x["description"],:code=>x["code"]})
        x["subjects"].each do |y|
          Academic.create!(:course_id => c["id"], :subject_num => y["id"])
        end
      end
    end
    @courses = Course.all.paginate(:page => params[:page], :per_page => 30)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def enroll
    @registration = Registration.create(user_id: params[:user_id], course_id: params[:course_id])

    if @registration.save 
      flash[:success] = "You have successfully enrolled."
      redirect_to user_path(current_user)
    else 
      flash[:danger] = "Please try again."
      redirect_to user_path(current_user)
    end
    # Registration.create(:user_id =>current_user, :course_id=> @course )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :description, :code, :search)
    end

end
