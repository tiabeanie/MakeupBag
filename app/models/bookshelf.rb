class Bookshelf < ActiveRecord::Base
    has_many :books
    belongs_to :user
  
    def self.valid_params?(params)
      return !params[:name].blank? && !params[:color].blank?
    end
  end