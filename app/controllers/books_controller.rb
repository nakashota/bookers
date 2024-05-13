class BooksController < ApplicationController
  def top

  end


  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
     redirect_to book_path(@book.id)
     flash[:notice] = "Book was successfully created."
    else
     @books = Book.all 
      flash[:notice] = "errors prohibited this book from being saved."
     render :index
    end 
  end

  def new
  end

  def show
    @book = Book.find(params[:id])

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
     flash[:notice] ="error prohibited this book from being saved."
    render :edit
   end  
  end

  def destroy
     book = Book.find(params[:id]) 
    book.destroy 
    redirect_to '/books' 
  end  


  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end