module UsersHelper
    
    def showproj
      @proj = Proj.find(params[:id])
    end

    def edit
      @proj = Proj.find(params[:id])
    end

    def update
      if @proj.update(proj_params)
        flash[:success] = "Project updated"
        redirect_to @user
      else
        render 'edit'
      end
    end


=begin 
    def changerole(user)
      @user = User.find(user.id)
      if @user.admin==1
        @user.admin=0
        @user.save
      end    
      if @user.admin==0
        @user.admin=1
        @user.save
      end
      
    end
=end

    private
  
      def proj_params
        params.require(:proj).permit(:name, :description)
      end

      def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation, :admin)
      end
end