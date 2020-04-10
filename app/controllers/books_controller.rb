class BooksController < ApplicationController 
    get "/books" do
      redirect_to_login 
      @books = current_user.books
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
      set_book
      redirect_if_not_authorized(@book.bookshelf.user, "/books/new")
      erb :'books/edit'
    end
  
    patch "/books/:id" do
      redirect_to_login 
      set_book
      redirect_if_not_authorized(@book.bookshelf.user, "/books/#{book.id}")
      @book.update(params[:book])
      redirect "/books/#{@book.id}"
    end
  
    get "/books/:id" do
      redirect_to_login 
      set_book
      erb :'books/show'
    end
  
    post "/books" do
      redirect_to_login
      @book = Book.new(params)
      redirect_if_not_authorized(@book.bookshelf.user, "/books")
      @book.save
      redirect "/books"
    end

    delete '/books/:id' do
      set_book
      redirect_if_not_authorized(@book.bookshelf.user, "/books/#{@book.id}")
      @book.delete
      redirect to "/users/#{current_user.id}"
    end

    private
    def set_book
     set_book
    end
  end