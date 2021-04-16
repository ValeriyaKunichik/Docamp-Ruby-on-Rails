class StaticPagesController < ApplicationController

    def home
      @proj = current_user.projs.build if signed_in?
    end
 
  end