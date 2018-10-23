class BooksController < ApplicationController
    before_action :authenticate_user!

    before_action :correct_user, only: [:edit, :update]

    def correct_user
  		@book = current_user.books.find_by(id: params[:id])
    	unless @book
      	redirect_to books_path
    	end
	end

	def index
		@book = Book.new
		@user = User.find(current_user.id)
		
		@books = Book.all

		@books = @books.page(params[:page])
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
		  flash[:notice] ="Book was successfully created."
		  redirect_to book_path(@book.id)
		else
		  @user = User.find(current_user.id)
			
		  @books = Book.all

		  @books = @books.page(params[:page])
		  render :index
		end
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user

		@book2 =Book.new
	end

	def edit
    	@book = Book.find(params[:id])
    end

    def update
		@book = Book.find(params[:id])
    	if @book.update(book_params)
    	  flash[:notice] ="Book was successfully updated."
    	  redirect_to book_path(@book.id)
    	else
    	end
	end

	def destroy
        @book = Book.find(params[:id])
        if @book.destroy
    	  flash[:notice] ="Book was successfully deleted."
          redirect_to books_path
        else
        end
    end

	private
	def book_params
  		params.require(:book).permit(:book_title, :book_body)
    end

end
