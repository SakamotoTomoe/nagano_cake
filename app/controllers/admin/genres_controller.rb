class Admin::GenresController < ApplicationController
  def index
  end

  def edit
  end

  def create
    genre = Genre.new(genre_params)
    genre.save
    redirect_to 'admin/genres'
  end
end
