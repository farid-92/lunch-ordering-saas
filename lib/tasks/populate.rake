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
