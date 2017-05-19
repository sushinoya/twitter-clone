if Rails.env.development? || Rails.env.test? || Rails.env.staging?
  namespace :dev do
    desc 'Sample data for local development environment'
    task prime: :environment do
      execute = proc do |seed|
        seed_path = Rails.root.join('db', 'seeds', "#{seed}.rb")
        if File.file?(seed_path)
          print "Seeding #{seed} ... "
          require seed_path
          puts 'Done!'
        end
      end

      public_data = %w(users)
      public_data.each(&execute)

      puts 'Done adding test data'
    end
  end
end
