class StudentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :load_student, only: [:edit, :update, :show, :destroy]

  def index
  end

  def show
  end

  def new
    @student = Student.new
    @sections = Section.where(teacher_id: current_user.id)
  end

  def create
    @student = Student.new safe_student_params

    if @student.save
      redirect_to section_path(@student.section_id)
    else
      render 'new'
    end
  end

  def edit
    @sections = Section.where(teacher_id: current_user.id)
  end
  
  def destroy
    @section_id = @student.section_id
    Student.find(params[:id]).delete
    redirect_to section_path(@section_id)
  end


  def update
    if @student.update safe_student_params
      redirect_to section_path(@student.section_id)
    else
      render 'edit'
    end
  end
  ############

  private
  def safe_student_params
    params.require('student').permit(:first_name, :last_name, :emerg_contact_name, :emerg_contact_phone, :section_id)
  end
  
  def load_student
    @student = Student.find params[:id]
  end

end