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
      if @book.user == current_user
        erb :'books/edit'
      else 
        redirect to "/books/new"
      end
    end
  
    patch "/books/:id" do
     redirect_to_login 
      @book = Book.find_by_id(params[:id])
      unless Book.valid_params?(params)
        redirect "/books/#{@book.id}/edit?error=invalid book"
      end
      @book.update(params.select{|k|k=="name" || k=="author" || k=="book_id"})
      redirect "/books/#{@book.id}"
    end
  
    get "/books/:id" do
     redirect_to_login 
      @book = Book.find_by_id(params[:id])
      erb :'books/show'
    end
  
    post "/books" do
     redirect_to_login
     #if params[:name].blank? && params[:author].blank?
      #  redirect "/books/new?error=invalid book"
     #else 
      @book = Book.new(params)
      @book.user_id = current_user.id
      @book.save
      redirect "/books"
     #end 
    end

    delete '/books/:id' do
      @book = Book.find_by_id(params[:id])
      if @book.user == current_user
        @book.delete
        redirect to "/users/#{current_user.id}"
      else
        redirect to "/books/#{@book.id}"
      end
    end
  end