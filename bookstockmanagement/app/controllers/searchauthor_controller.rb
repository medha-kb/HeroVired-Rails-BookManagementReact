class SearchauthorController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        bookVal = Book.find_by('bookAuthor': params[:bookAuthor])
        if bookVal
            render json: {data: bookVal}, state: :ok
          else
            render json: {message: "Book written by author not found"}, status: :bad_request
          end
    end

end
