class Course < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  def self.valid_params?(params)
    return !params[:professor].empty? && !params[:capacity].empty?
  end
end
