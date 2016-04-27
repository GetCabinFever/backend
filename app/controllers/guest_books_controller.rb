class GuestBooksController < ApplicationController
  before_action :authenticate!, only: [:create, :update, :destroy]

  def create
    @residence = Residence.find_by params['id']
    @residence.guest_books.create guest_book_params
    render 'create.json.jbuilder', status: :ok
  end

  def update
    @guest_book = GuestBook.find params['id']
    @guest_book.update guest_book_params
    render 'create.json.jbuilder', status: :accepted
  end

  def delete
    @guest_book = GuestBook.find params['id']
    if current_user.id == @guest_book.user_id
      @guest_book.destroy
    end
  end

  private
  def guest_book_params
    params.permit(:entry, :user_id)
  end
end
