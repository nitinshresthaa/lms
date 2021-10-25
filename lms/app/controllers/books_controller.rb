class BooksController < ApplicationController
    before_action :book_id, only: [:edit, :update, :show, :destroy]
    def index
        @books = Book.all
    end

    def new
        @book = Book.new
    end

    def create
        @book  = Book.new(book_params)
        if(@book.save)
            flash[:success] = "Book has been added"
            redirect_to book_path(@book)
        else
            flash[:warning] = "Book couldnot be added"
            render 'new'
        end
    end

    def show
    end

    def edit
    end

    def update
        if @book.update(book_params)
            redirect_to book_path(@book)
            flash[:success] = "book was updated"
          else
            flash[:warning] = "book could not be updated"
            render 'edit'
          end
        end
    
    def destroy
        @book.destroy
        flash[:notice] = "book was deleted"
        redirect_to books_path
  
    end

    private

    def book_params
        params.require(:book).permit(:title, :description)
    end
        def book_id
            @book = Book.find(params[:id])
        end
end
