class ProjsController < ApplicationController
    before_action :signed_in_user
    
    def create
      @proj = current_user.projs.build(proj_params)
      if @proj.save
        flash[:success] = "Project created!" 
        redirect_to current_user
      else
        render 'users/home'
      end
    end

    def showproj
      @proj = Proj.find(params[:id])
    end
    
    def edit
      @proj = Proj.find(params[:id])
    end

    def destroy
      @proj = Proj.find(params[:id])
      @proj.destroy
      #Proj.find(params[:id]).destroy
      flash[:success] = "Project deleted."
      redirect_to @current_user
    end
    
    def update
      @proj = Proj.find(params[:id])
      if @proj.update(proj_params)
        flash[:success] = "Project updated"
        redirect_to @current_user
      else
        render 'edit'
      end
    end

    private
  
    def proj_params
      params.require(:proj).permit(:name, :description)
    end
end