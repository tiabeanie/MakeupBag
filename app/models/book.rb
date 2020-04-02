class Book < ActiveRecord::Base
    belongs_to :bookshelf
  
    # def self.valid_params?(params)
    #   return !params[:name].blank? && !params[:author].blank?
    # end
 end