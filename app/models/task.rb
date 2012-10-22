class Task < ActiveRecord::Base
  attr_accessible  :judul_task, :kategori, :ket_task, :status, :tempat_task, :tgl_task   ,:department  ,:id_user,:latitude, :longitude ,:gmaps
      validates_presence_of :judul_task,:tgl_task,:status, :tempat_task
      
    has_many :reminder,:dependent => :destroy
#      validates_uniqueness_of :email_user



  def self.search(search,departemen)
    if search
      find(:all, :conditions => ['department LIKE ? and (tempat_task LIKE ? or kategori LIKE ? or judul_task LIKE ? or ket_task LIKE ? )',"#{departemen}","%#{search}%","%#{search}%", "%#{search}%","%#{search}%"],:order=>'status asc, tgl_task desc')
    else
      find(:all ,:conditions => ['department LIKE ? )',"#{departemen}"],:order=>'status asc, tgl_task desc')
    end
  end

  acts_as_gmappable
  def gmaps4rails_address
    tempat_task
  end
  def gmaps4rails_infowindow
    judul_task
  end

end
