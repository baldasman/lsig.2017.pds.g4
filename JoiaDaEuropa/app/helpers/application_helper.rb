module ApplicationHelper

    def resource_name
        :user
    end

    def resource
        User.new
    end

    def devise_mapping
        Devise.mappings[:user]
    end

end
