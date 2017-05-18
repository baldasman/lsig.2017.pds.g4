class Order < ApplicationRecord
  belongs_to :client

  #def self.search(search)
    #if search      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    #else      find(:all)
    #end
  #end


end
