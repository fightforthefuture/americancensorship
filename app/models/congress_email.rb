class CongressEmail < ActiveRecord::Base
  validates_presence_of :name, :email, :address, :zip, :letter
end
