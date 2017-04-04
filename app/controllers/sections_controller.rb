class SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :get_section, only: [:edit, :update, :show, :destroy]

  def index
    @sections = Section.where(teacher_id: current_user.id)
  end

  def show
    @students = Student.joins(:student_sections).where(:student_sections => {section_id: @section.id})
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    @section.teacher = current_user
    if @section.save
      redirect_to @section
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @section.update(section_params)
      redirect_to @section
    else
      render 'edit'
    end
  end

  def destroy
    if @section.delete
      redirect_to sections_path
    else
      redirect_to @section
    end
  end

  private
  def section_params
    params.require(:section).permit(:name, {student_ids:[]})
  end

  def get_section
    @section = Section.find(params[:id])
  end

end
