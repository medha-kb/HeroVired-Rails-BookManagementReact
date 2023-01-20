class SearchnameController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        bookVal = Book.find_by('bookName': params[:bookName])
        if bookVal
            render json: {data: bookVal}, state: :ok
          else
            render json: {message: "Book could not be found"}, status: :bad_request
          end
    end
end
