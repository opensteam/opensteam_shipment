namespace :opensteam do
  namespace :plugins do
    namespace :shipment do

      desc "install the shipment plugin for opensteam (copy migration files..)"
      task :install do
        system "rsync -ruv vendor/plugins/opensteam_shipment/db/migrate db"
      end
    end
  end
end

