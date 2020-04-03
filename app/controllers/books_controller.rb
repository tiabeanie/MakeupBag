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
      @book = Book.find_by_id(params[:id])
      if @book.bookshelf.user == current_user
        erb :'books/edit'
      else 
        redirect to "/books/new"
      end
    end
  
    patch "/books/:id" do
     redirect_to_login 
      @book = Book.find_by_id(params[:id])
      if @book.bookshelf.user == current_user
      @book.update(params[:book])
      redirect "/books/#{@book.id}"
      else 
      redirect "/books/#{@book.id}"
      end
    end
  
    get "/books/:id" do
     redirect_to_login 
      @book = Book.find_by_id(params[:id])
      erb :'books/show'
    end
  
    post "/books" do
     redirect_to_login
      @book = Book.new(params)
      if @book.bookshelf.user == current_user
        @book.save
        redirect "/books"
      else  
        redirect "/books"
      end 
    end

    delete '/books/:id' do
      @book = Book.find_by_id(params[:id])
      if @book.bookshelf.user == current_user
        @book.delete
        redirect to "/users/#{current_user.id}"
      else
        redirect to "/books/#{@book.id}"
      end
    end
  end