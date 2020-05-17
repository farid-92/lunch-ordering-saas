class User::MenusController < DashboardController

  def index
    @menus = current_user.organization.menus
  end

  def show
    @result = Menu::Show.call(params: params)
    @menu = @result.menu
    @menu_categories = @result.menu_categories
  end
end
