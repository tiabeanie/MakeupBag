class BookshelvesController < ApplicationController 

    get "/bookshelves" do
      redirect_if_not_logged_in
      @bookshelves = Bookshelf.all
      erb :'bookshelves/index'
    end
  
    get "/bookshelves/new" do
      redirect_if_not_logged_in
      @error_message = params[:error]
      erb :'bookshelves/new'
    end
  
    get "/bookshelves/:id/edit" do
      redirect_if_not_logged_in
      @error_message = params[:error]
      @bookshelf = Bookshelf.find(params[:id])
      erb :'bookshelves/edit'
    end
  
    post "/bookshelves/:id" do
      redirect_if_not_logged_in
      @bookshelf = Bookshelf.find(params[:id])
      unless Bookshelf.valid_params?(params)
        redirect "/bookshelves/#{@bookshelf.id}/edit?error=invalid bookshelf"
      end
      @bookshelf.update(params.select{|k|k=="name" || k=="color"})
      redirect "/bookshelves/#{@bookshelf.id}"
    end
  
    get "/bookshelves/:id" do
      redirect_if_not_logged_in
      @bookshelf = Bookshelf.find(params[:id])
      erb :'bookshelves/show'
    end
  
    post "/bookshelves" do
      redirect_if_not_logged_in
  
      unless Bookshelf.valid_params?(params)
        redirect "/bookshelves/new?error=invalid bookshelf"
      end
      Bookshelf.create(params)
      redirect "/bookshelves"
    end
  end