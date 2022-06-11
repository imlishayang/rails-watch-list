class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.save
    redirect_to lists_path(@list)
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end
end
