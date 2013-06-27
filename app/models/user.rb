class User < ActiveRecord::Base
  validates :email, :first_name, :presence => true
  validates :email, :uniqueness => true

  def name
    first_name
  end
end
