class Book < ApplicationRecord

    validates :bookName, presence: true, length: {in: 1..100}  , uniqueness: true
    validates :bookAuthor, presence: true, length: {in: 1..100}
    validates :bookQuantity, numericality: {only_integer: true}, allow_blank: true

end