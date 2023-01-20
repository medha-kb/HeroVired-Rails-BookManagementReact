class BookController < ApplicationController
    skip_before_action :verify_authenticity_token
    #to skip token authentication
    # all methods to create fetch and display books
    #list all books
    def index      
        allBooks = Book.order(id: :desc).all

        if allBooks
            render json: allBooks
        else
            render json: allBooks.errors        
        end
    end
#details of individual book based on id
    # GET Request
    def show
        bookDetail = Book.find(params[:id])
        render json: bookDetail
        # params grab the input from the user or rather the id from the url in this case
    end
#adding new book
    #POST Request
    def create     
        if(params) 
            Book.create!(book_params)
            # 'bookName': params[:bookName],
            # 'bookAuthor': params[:bookAuthor], 
            # 'bookQuantity': params[:bookQuantity] )   
            newBook = Book.last  
            render json: {message:"Book Addtion successful!" , newBook:}
        
        else
            render json: "Book addition failed"
        end
        
    end
#updating book details
    def update
        # Fetching the new record
        # b = Book.last
        bookVal = Book.find(params[:id].to_i)
        # b.update!(b_params)
        if(bookVal.update!(book_params))
            # 'bookName': params[:bookName], 'bookAuthor': params[:bookAuthor], 'bookQuantity': params[:bookQuantity]))
            
            render json: "Book Details Updated Successfully"
        else
            render json: "Book details cannot be updated"
        end
    end
#delete the  book
    def destroy
        bookVal = Book.find(params[:id])
        
        if bookVal.destroy!
            render json: "Book Deleted Successfully"
        else
            render json: "Book does not exist in database"
        end
    end

#delete the new book
 
def book_params
    params.require(:book).permit(:bookName, :bookAuthor, :bookQuantity)
  end
end
