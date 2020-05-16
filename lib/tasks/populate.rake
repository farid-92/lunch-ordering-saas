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
