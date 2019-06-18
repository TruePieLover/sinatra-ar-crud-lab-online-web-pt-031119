<<<<<<< HEAD
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

def fi_check_migration
  begin
    ActiveRecord::Migration.check_pending!
  rescue ActiveRecord::PendingMigrationError
    raise ActiveRecord::PendingMigrationError.new <<-EX_MSG
Migrations are pending. To resolve this issue, run:
      rake db:migrate SINATRA_ENV=test
EX_MSG
  end
end

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require_all 'app'
=======
require './config/environment'

if ActiveRecord::Base.connection.migration_context.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

use Rack::MethodOverride

run ApplicationController
>>>>>>> 6f7477ddd0119e860499e4a24cb20a806333cb37
