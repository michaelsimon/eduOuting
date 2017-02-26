class TeachersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :load_teacher, only: [:edit, :update, :destroy]
  
  def new
    @teacher = Teacher.new
    @users = User.all
  end

  def create
    @teacher = Teacher.new safe_teacher_params
    if @teacher.save
      redirect_to @teacher
    else
      render :new
    end
  end
  def index
    @teachers = Teacher.all
  end
  def edit
    @user = User.find(@teacher.id).email
  end

  def update
    if @teacher.update safe_teacher_params
      redirect_to root_path
    else
      render 'edit'
    end
  end


  private
  def safe_teacher_params
    params.require('teacher').permit(:first_name, :last_name, :user_id)
  end

  def load_teacher
    @teacher = Teacher.find params[:id]
  end

end
