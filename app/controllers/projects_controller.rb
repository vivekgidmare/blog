class ProjectsController < ApplicationController
  before_action :find_project,only: [:show , :edit, :update, :destroy ]
  def index
    @projects = Project.all.order("created_at DESC").paginate(page: params[:page], per_page: 2)
  end

  def new
    @project =Project.new
  end

  def create
    @project = Project.new(project_param)
    if @project.save
      redirect_to @project ,notice: "Hey Vivek! You have successfuly created the project!"
    else
      render 'new' , notice: "Ohh No!Unable to save your project"
    end
  end

  def show
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def project_param
    # params.require(:project).permit(:title,:decription,:link,:slug)
    params.require(:project).permit(:title,:decription,:link)
  end
  def find_project
    @project =Project.find(params[:id])
  end
end
