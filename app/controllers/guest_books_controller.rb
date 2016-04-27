class GuestBooksController < ApplicationController
  before_action :authenticate!, only: [:create, :update, :destroy]

  def create
    @guest_book = current_user.guest_books.new(guest_book_params)
    if @guest_book.save
      render 'create.json.jbuilder', status: :ok
    else
      render json: { errors: @user.errors.full_messages },
                     status: :unprocessable_entity
    end
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
    params.permit :entry
  end
end
