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
