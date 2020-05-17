class User::MenusController < ApplicationController
  layout 'user'
  before_action :authenticate_user!

  def index
    @menus = current_user.organization.menus
  end

  def show
    @result = Menu::Show.call(params: params)
    @menu = @result.menu
    @menu_categories = @result.menu_categories
  end
end
