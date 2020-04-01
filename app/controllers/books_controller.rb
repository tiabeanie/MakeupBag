class BooksController < ApplicationController 
    get "/books" do
     redirect_to_login 
      @books = Book.all
      erb :'books/index'
    end
  
    get "/books/new" do
     redirect_to_login 
      @error_message = params[:error]
      erb :'books/new'
    end
  
    get "/books/:id/edit" do
     redirect_to_login 
      @error_message = params[:error]
      @book = Book.find(params[:id])
      if logged_in? && current_user.books.include?(@book)
        erb :'books/edit'
      else 
        redirect to "/books/new"
      end
    end
  
    post "/books/:id" do
     redirect_to_login 
      @book = Book.find(params[:id])
      unless Book.valid_params?(params)
        redirect "/books/#{@book.id}/edit?error=invalid book"
      end
      @book.update(params.select{|k|k=="name" || k=="author" || k=="bookshelf_id"})
      redirect "/books/#{@book.id}"
    end
  
    get "/books/:id" do
     redirect_to_login 
      @book = Book.find_by_id(params[:id])
      erb :'books/show'
    end
  
    post "/books" do
     redirect_to_login 
      unless Book.valid_params?(params)
        redirect "/books/new?error=invalid book"
      end
      Book.create(params)
      redirect "/books"
    end
  end