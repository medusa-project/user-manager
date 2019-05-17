namespace :users do

  desc 'Create an admin user'
  task :create_admin, [:username] => :environment do |task, args|
    User.create!(username: args[:username],
                 roles: [Role.find_by_key(Role::ADMIN_KEY)])
  end

end
