class StudentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :load_student, only: [:edit, :update, :show, :destroy]

  def index
    @students = Student.all
    #@sections = Section.where(student_id: @student)
  end

  def show
  end

  def new
    #@student = Student.new
    @sections = Section.all
  end

  def create
    @student = Student.new safe_student_params

    if @student.save
      redirect_to @student
    else
      render 'new'
    end
  end

  def edit
    @section = Section.find(@student.section_id)
  end

  def destroy
  end


def update
    if @student.update safe_student_params
      redirect_to @student
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