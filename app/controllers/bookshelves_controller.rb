class BookshelvesController < ApplicationController 

    get "/bookshelves" do
      redirect_to_login
      @bookshelves = Bookshelf.all
      erb :'bookshelves/index'
    end
  
    get "/bookshelves/new" do
      redirect_to_login
      @error_message = params[:error]
      erb :'bookshelves/new'
    end
  
    get "/bookshelves/:id/edit" do
      redirect_to_login
      @error_message = params[:error]
      @bookshelf = Bookshelf.find(params[:id])
      if logged_in? && current_user.bookshelves.include?(@bookshelf)
        erb :'bookshelves/edit'
      else
        redirect to "/bookshelves/new"
      end 
    end
  
    post "/bookshelves/:id" do
      redirect_to_login
      @bookshelf = Bookshelf.find(params[:id])
      unless Bookshelf.valid_params?(params)
        redirect "/bookshelves/#{@bookshelf.id}/edit?error=invalid bookshelf"
      end
      @bookshelf.update(params.select{|k|k=="name" || k=="color"})
      redirect "/bookshelves/#{@bookshelf.id}"
    end
  
    get "/bookshelves/:id" do
      redirect_to_login
      @bookshelf = Bookshelf.find(params[:id])
      erb :'bookshelves/show'
    end
  
    post "/bookshelves" do
      redirect_to_login
      unless Bookshelf.valid_params?(params)
        redirect "/bookshelves/new?error=invalid bookshelf"
      end
      Bookshelf.create(params)
      redirect "/bookshelves"
    end
  end