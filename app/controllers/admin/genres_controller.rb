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