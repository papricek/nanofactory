namespace :nanofactory do

  desc "create or update user"
  # Create user:      rake nanofactory:create_user[sasa@seznam.cz,123456]
  # Change password:  rake nanofactory:create_user[sasa@seznam.cz,654321]
  task :create_user, [:email, :password] => :environment do |task, args|
    user = User.where(email: args.email).first_or_initialize
    user.password = args.password
    user.save!
    if user.created_at_changed?
      puts "New user '#{user.email}' was created."
    else
      puts "Already existing user '#{user.email}' was updated."
    end
  end

  desc "destroy user"
  # Destroy user:     rake nanofactory:destroy_user[sasa@seznam.cz]
  task :destroy_user, [:email] => :environment do |task, args|
    user = User.where(email: args.email).first
    if user.present? && user.destroy
      puts "User '#{user.email}' was destroyed."
    else
      puts "User with email '#{args.email}' wasnt found nor destroyed."
    end
  end

end
