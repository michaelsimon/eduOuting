class SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :load_section, only: [:edit, :update, :show, :destroy]
  before_action :safe_section_params, only: [:update, :create]

  def index
    @sections = Section.where(teacher_id: current_user.id)
  end

  def show
    @students = Student.where(section_id: @section.id)
  end
  
  def destroy
  Section.find(params[:id]).delete
  redirect_to sections_path
  end

  def new
    @section = Section.new
    @teachers = Teacher.all
  end

  def create
    @section = Section.new safe_section_params
    @section.teacher_id = current_user.id
    if @section.save
      redirect_to sections_path
    else
      render :new
    end
  end

  def edit
    @teachers = Teacher.all
  end

def update
    if @section.update safe_section_params
      redirect_to sections_path
    else
      render 'edit'
    end
  end
  ############

  private
  def safe_section_params
    params.require('section').permit(:name)
  end
  
  def load_section
    @section = Section.find params[:id]
  end

end