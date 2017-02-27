class TeachersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :get_teacher, only: [:edit, :update]

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
    @users = User.all
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to @teacher
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(@teacher.id).email
  end

  def update
    if @teacher.update(teacher_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end


  private
  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :user_id)
  end

  def get_teacher
    @teacher = Teacher.find(params[:id])
  end

end
