class ApplicationController < ActionController::Base

    def index
        render html: "Book stock management page with postgres and rails"
    end
end
