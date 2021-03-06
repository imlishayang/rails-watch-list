class ListsController < ApplicationController
  def home
    @list = List.new
  end

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @lists = List.all
    @list = List.new(list_params)
      if @list.save
        redirect_to lists_path
      else
        render 'index' # keeps staying there
      end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
  end

  private
    def list_params
      params.require(:list).permit(:name, photo: [])
    end
end
