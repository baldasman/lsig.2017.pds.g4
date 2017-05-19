class Order < ApplicationRecord
    belongs_to :client
    belongs_to :state
    belongs_to :upload

    #def self.search(search)
    #if search      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    #else      find(:all)
    #end
    #end


end
