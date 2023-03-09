class BooksController < ApplicationController
  def index
    @author = Author.find(params[:author_id])
    @books = Book.where(author_id: params[:author_id])
  end

  def new
    @author = Author.find(params[:author_id])
    @book = @author.books.new
  end

  def create
    @author = Author.find(params[:author_id])
    @book = @author.books.new(book_params)

    if @book.save
      redirect_to author_books_path(params[:author_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @book = Book.find(params[:id])
    @author = Author.find(params[:author_id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to author_books_path(params[:author_id])
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to author_books_path(params[:author_id])
  end

  private
  
  def book_params
    params.require(:book).permit(:name, :price)
  end
end
