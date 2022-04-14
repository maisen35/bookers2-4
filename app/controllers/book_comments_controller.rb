class BookCommentsController < ApplicationController
  belongs_to :user
  belongs_to :book
end
