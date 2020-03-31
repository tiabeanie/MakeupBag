class BooksController < ApplicationController 
    get "/books" do
      redirect_if_not_logged_in 
      @books = Book.all
      erb :'books/index'
    end
  
    get "/books/new" do
      redirect_if_not_logged_in 
      @error_message = params[:error]
      erb :'books/new'
    end
  
    get "/books/:id/edit" do
      redirect_if_not_logged_in 
      @error_message = params[:error]
      @book = Book.find(params[:id])
      erb :'books/edit'
    end
  
    post "/books/:id" do
      redirect_if_not_logged_in 
      @book = Book.find(params[:id])
      unless Book.valid_params?(params)
        redirect "/books/#{@book.id}/edit?error=invalid book"
      end
      @book.update(params.select{|k|k=="name" || k=="author" || k=="bookshelf_id"})
      redirect "/books/#{@book.id}"
    end
  
    get "/books/:id" do
      redirect_if_not_logged_in 
      @book = Book.find(params[:id])
      erb :'books/show'
    end
  
    post "/books" do
      redirect_if_not_logged_in 
      unless Book.valid_params?(params)
        redirect "/books/new?error=invalid book"
      end
      Book.create(params)
      redirect "/books"
    end
  end