class Book < ActiveRecord::Base
    belongs_to :bookshelf
  
    def self.valid_params?(params)
      return !params[:name].empty? && !params[:author].empty?
    end
  end