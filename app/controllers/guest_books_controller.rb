class GuestBooksController < ApplicationController
  before_action :authenticate!, only: [:create, :update, :destroy]

  def create
    @residence = Residence.find_by params['id']
    @guest_book = @residence.guest_books.create guest_book_params
    @guest_book.user_id = current_user.id
    if @guest_book.save
      render 'create.json.jbuilder', status: :ok
    else
      render json: { errors: @residence.errors.full_messages },
                     status: :unauthorized
    end
  end

  def update
    @guest_book = GuestBook.find params['id']
    @guest_book.update(guest_book_params)
    render 'create.json.jbuilder', status: :accepted
  end

  def destroy
    @guest_book = GuestBook.find params['id']
    if current_user.id == @guest_book.user_id
      @guest_book.destroy
    else
      render json: { errors: @guest_book.errors.full_messages },
                     status: :unauthorized
    end
  end

  private
  def guest_book_params
    params.permit(:entry)
  end
end
