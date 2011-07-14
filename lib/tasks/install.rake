namespace :spree_wishlist do
  desc "Copies all migrations and assets"
  task :install do
    Rake::Task['spree_wishlist:install:migrations'].invoke
    Rake::Task['spree_wishlist:install:assets'].invoke
  end

  namespace :install do
    desc "Copies all migrations"
    task :migrations do
      source = File.join(File.dirname(__FILE__), '..', '..', 'db')
      destination = File.join(Rails.root, 'db')
      Spree::FileUtilz.mirror_files(source, destination)
    end

    desc "Copies all assets"
    task :assets do
      source = File.join(File.dirname(__FILE__), '..', '..', 'app/assets')
      destination = File.join(Rails.root, 'app/assets')
      puts "INFO: Mirroring assets from #{source} to #{destination}"
      Spree::FileUtilz.mirror_files(source, destination)
    end
  end

end
