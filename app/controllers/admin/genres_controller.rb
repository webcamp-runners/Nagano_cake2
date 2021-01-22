class Admin::GenresController < ApplicationController


  def index
   @genres = Genre.all
   @genres = Genre.all.page(params[:page]).per(10)
  end

  def edit
   @genre = Genre.find(params[:id])
  end

  def create
   @genre = Genre.new(genre_params)
    if @genre.save
       flash[:notice] = "ジャンルを追加しました"
       redirect_to admin_genres_path
    else
      @genres = Genre.all.page(params[:page]).per(10)
       render "edit"
    end
  end

  def update
   @genre = Genre.find(params[:id])
  end


 private

end
