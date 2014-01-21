class RefrencesController < ApplicationController
  
  def new
    @refrence = Refrence.new
    @course = Course.find(params[:course_id])
  end

  def create
    @refrence = Refrence.new(refrence_params)
    @course = Course.find(params[:course_id])
    @refrence.course_id = @course.id
    if @refrence.save
      flash[:notice] = 'Your document has been added to this course'
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  private

  def refrence_params
    params.require(:refrence).permit(:doc, :course_id, :name)
  end

end
