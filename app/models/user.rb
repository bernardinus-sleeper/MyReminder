class User < ActiveRecord::Base
  attr_accessible :id, :password,:nama,:updated_at, :department

  validates :nama,  :presence => true
  validates :password, :presence => true,
                    :length => { :minimum => 2 }


end
