namespace :db do
  desc "Populate database"
  task populate: :environment do
    full_reset

    puts 'Create admin'
    Admin.create(
      email: 'admin@example.com',
      password: 12345678
    )
    puts 'CREATED!!!'
    organization = Organization.create(name: 'Coca-cola')
    user = User.create(email: 'test@gmail.com', name: 'Jack Black', password: 123456, organization_id: organization.id)
    menu = Menu.create(name: 'Special menu', organization_id: organization.id)
    category_1 = Category.create(title: 'first course', menu_id: menu.id)
    category_2 = Category.create(title: 'main course', menu_id: menu.id)
    category_3 = Category.create(title: 'drink', menu_id: menu.id)
    menu_item = MenuItem.create(name: 'soup', category_id: category_1.id, price: rand(30..100))
    menu_item_1 = MenuItem.create(name: 'soup 1', category_id: category_1.id, price: rand(30..100))
    menu_item_1_2 = MenuItem.create(name: 'soup 2', category_id: category_1.id, price: rand(30..100))
    menu_item_2 = MenuItem.create(name: 'lagman', category_id: category_2.id, price: rand(30..100))
    menu_item_2_1 = MenuItem.create(name: 'chicken', category_id: category_2.id, price: rand(30..100))
    menu_item_2_2 = MenuItem.create(name: 'plov', category_id: category_2.id, price: rand(30..100))
    menu_item_3 = MenuItem.create(name: 'coca-cola', category_id: category_3.id, price: rand(30..100))
    menu_item_3_1 = MenuItem.create(name: 'fanta', category_id: category_3.id, price: rand(30..100))
    menu_item_3_2 = MenuItem.create(name: 'coffee', category_id: category_3.id, price: rand(30..100))
    puts 'Default testing info created'

    dummy :organizations, 10 do
      organization = Organization.new
      organization.name = FFaker::Company.name
      organization.save!
    end

    dummy :menus, 10 do
      menu = Menu.new
      menu.name = "menu"
      menu.organization_id = rand(1..10)
      menu.save!
    end

    dummy :users, 10 do
      name = FFaker::Name.first_name
      user = User.new
      user.name = name
      user.email = name + '@example.com'
      user.password = 'password'
      user.organization_id = rand(1..10)
      user.role = rand(0..1)
      user.save!
    end

  end

  def full_reset
    Rake::Task['db:reset'].invoke
    FileUtils.rm_rf(Dir["#{Rails.root}/public/files"])
  end

  def dummy title, number=1
    puts "Creating dummy #{title}..."
    number.times { yield }
    puts "...done"
  end
end
