class Menu::Show
  include Interactor

  def call
    params = context.params
    menu = Menu.find(params[:id])
    menu_categories = menu.categories
    context.menu = menu
    context.menu_categories = menu_categories
  end
end
