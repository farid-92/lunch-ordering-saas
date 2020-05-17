class User::MenuItemsController < ApplicationController
  layout 'user'
  before_action :set_menu_item, except: [:index]

  def index; end

  def new;
    menu = Menu.find(params[:menu_id])
    @menu_categories = menu.categories
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    if @menu_item.save
      redirect_to menu_path(@menu_item.category.menu.id)
    else
      render :new
    end
  end

  def edit
    menu = Menu.find(params[:menu_id])
    @menu_categories = menu.categories
  end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to menu_path(@menu_item.category.menu.id)
    else
      render :edit
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to menu_path(@menu_item.category.menu.id)
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :category_id, :photo)
  end

  def set_menu_item
    @menu_item = MenuItem.find_or_initialize_by(id: params[:id])
  end
end
