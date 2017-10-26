class SearchController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  def new
    @search = Search.new
    
  end
  # GET /courses
  # GET /courses.json
  def index
    # if params[:search]
    #   @courses = Course.search(params[:search].downcase).paginate(:page => params[:page], :per_page => 30)
    #   respond_to do |format|
    #     format.html # search.html.erb
    #     # format.json { render json: search_path }
    #     format.js
    #   end
    # else
    @subjects = Subject.all
    @courses = Course.all.paginate(:page => params[:page], :per_page => 30)
    # end
  end

  def search
    if params["filter"]==""
      @courses = Course.all
    else
      @courses = Course.where(id: Academic.where(subject_num: params["filter"]).map{|a| a.course_id})
    end
    @courses = @courses.search(params["phrase"].downcase).paginate(:page => params[:page], :per_page => 30)
   
    
    respond_to do |format|
      format.js {
        render json: { 
          content: (render_to_string partial: 'result', layout: false )  
        }
      }  
    end
  end
  

  # GET /courses/1
  # GET /courses/1.json
  def show
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
