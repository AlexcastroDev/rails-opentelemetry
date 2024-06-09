namespace :devops do
  desc 'Run all devops tasks'
  task prepare: :environment do
    puts "Running devops tasks..."

    puts "Checking if database exists..."
    if db_exists?
      puts "Database exists."
      Rake::Task['devops:migrate'].invoke
    else
      puts "Database does not exist. Creating database..."
      Rake::Task['db:create'].invoke
      Rake::Task['devops:migrate'].invoke
      #
    end
  end

  desc 'Migration task for devops'
  task :migrate do
    puts "Running migrations..."
    if ActiveRecord::Base.connection.migration_context.needs_migration?
      puts "Database is not migrated. Running migrations..."
      Rake::Task['db:migrate'].invoke
    end

    if Rails.env.development?
      if Hotel.count.zero?
        puts "Database is not seeded. Running seeds..."
        Rake::Task['db:seed'].invoke
      end
    end
  end

  private

  def db_exists?
    begin
      ActiveRecord::Base.connection
    rescue ActiveRecord::NoDatabaseError
      false
    else
      true
    end
  end
end
