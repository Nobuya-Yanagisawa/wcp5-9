class UsersController < ApplicationController
    before_action :authenticate_user!

	def show
		@book = Book.new
		@user = User.find(params[:id])

		@books = @user.books.page(params[:page])
	end

	def index
		@book = Book.new
		@user = User.find(current_user.id)

		@users = User.all
	end

	def edit
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(params[:id])
    	if @user.update(user_params)
		  flash[:notice] ="User information was successfully updated."
    	  redirect_to user_path(current_user.id)
		else
		  render :edit
		end
	end

	private

	def user_params
	    params.require(:user).permit(:name, :profile_image, :introduction)
	end
	

end