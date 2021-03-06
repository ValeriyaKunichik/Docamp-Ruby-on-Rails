class ProjectController < ApplicationController
  def index
    @projects = Project.all
    @project = Project.new
  end


def create
  @project = Project.new(project_params)

  respond_to do |format|
    if @project.save
      format.js
    else
      format.json { render json: @project.errors.messages, status: :unprocessable_entity }
    end
  end
end

def show
  @project = Project.find(params[:id])
end

def chat
  @message = Message.new
  @messages = Message.where project_id: params[:id] # Let's find the messages for this project!
  @project = Project.find(params[:id])
end


private

  def project_params
    params.require(:project).permit(:name, :description)
  end
end