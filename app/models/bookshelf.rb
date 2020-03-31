class Bookshelf < ActiveRecord::Base
    has_many :bookss
    belongs_to :user
  
    def self.valid_params?(params)
      return !params[:name].empty? && !params[:color].empty?
    end
  end