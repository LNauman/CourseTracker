class CoursesController < ApplicationController

  def show
    if current_user
      @user = current_user
      @course = Course.find(params[:id])
      @students = []
      @grades = []
      Enrollment.where(course_id: @course.id).each do |enrollment|
        @students << User.find_by(id: enrollment.student_id)
        @grades << enrollment.grade
      end
      @students = Kaminari.paginate_array(@students).page(params[:page]).per(6)
      if @grades.empty?
        @average = "There are no enrollments for this course. Why don't you upload some?"
      else
        @average = (@grades.sum/@grades.count).round(2)
      end
    elsif
      redirect_to root_path, notice: 'You need to sign in to see this page'
    end
  end

  def index
    if current_user
      @user = current_user
      @user_courses = @user.courses.page(params[:page]).per(6)
      @all_courses = Course.all.page(params[:page]).per(6)
    else
      redirect_to root_path, notice: 'You need to sign in to see this page'
    end
  end 

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(params[:refrence])
      flash[:notice] = 'Successfully updated course files.'
      redirect_to courses_path(@course)
    else
      render action: 'edit'
    end
  end

  private

  def course_params
    params.require(:course).permit(:title, :semester_id, :teacher_id, :refrence)
  end
end