class Sn < ActiveRecord::Base
  attr_accessible :p_age, :p_dofv, :p_dolv, :p_name, :p_record, :p_regno, :photo

  has_attached_file :photo, :styles => { :small => "150x150>" },
                  :url  => "/assets/products/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png', 'image/jpg']






def self.search(search)
  if search
    find(:all, :conditions => ['p_name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end
 
end
