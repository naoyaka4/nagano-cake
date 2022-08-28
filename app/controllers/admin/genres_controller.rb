# frozen_string_literal: true
class Admin::GenresController < ApplicationController
  # before_action :authenticate_user!#ログインしていない場合ログインに戻る指定
  
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end
  
  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end
  
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to request.referrer
  end
  
  # # 投稿データの保存
  # def create
  #   @book = Book.new(book_params)
  #   @book.user_id = current_user.id
  #   if @book.save
  #     redirect_to book_path(@book.id), notice: 'You have created book successfully.'
  #   else
  #     @user = current_user
  #     @books = Book.all
  #     render :index
  #   end  
  # end
   # request.referrer, notice: '記入してください。'
  
  # def edit
  #   @book = Book.find(params[:id])
  #   unless current_user == @book.user
  #     redirect_to books_path
  #   end
  # end

  private
  
  def genre_params
    params.require(:genre).permit(:name)#dbマイグレートで確認
  end
end