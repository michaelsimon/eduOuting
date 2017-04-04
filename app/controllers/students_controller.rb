class StudentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :get_student, only: [:edit, :update, :show, :destroy]

  def index
  end

  def show
  end

  def new
    @student = Student.new
    @sections = Section.where(teacher_id: current_user.id)
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to section_path(@student.sections.first)
    else
      render 'new'
    end
  end

  def edit
    @sections = Section.where(teacher_id: current_user.id)
  end

  def update
    if @student.update(student_params)
      redirect_to section_path(@student.sections.first)
    else
      render 'edit'
    end
  end

  def destroy
    if @student.delete
      redirect_to section_path(@student.sections.first)
    else
      redirect_to section_path(@student.sections.first)
    end
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :emerg_contact_name, :emerg_contact_phone, {section_ids:[]})
  end

  def get_student
    @student = Student.find(params[:id])
  end

end
