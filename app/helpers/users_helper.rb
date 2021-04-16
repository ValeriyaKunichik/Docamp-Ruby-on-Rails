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

    # Returns the Gravatar (http://gravatar.com/) for the given user.
    def gravatar_for(user)
      gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
      gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
      image_tag(gravatar_url, alt: user.name, class: "gravatar")
    end


    private
  
      def proj_params
        params.require(:proj).permit(:name, :description)
      end
end