# Install xdebug
include_recipe "chef-php-extra::xdebug"

bash 'run composer to grab extensions' do
  user 'root'
  cwd "/var/www/#{node['laravel']['name']}"
  code <<-EOH
  composer update
  EOH
end

# Run jocopo user auth plugin install first
#bash 'insert_db_laravel_authentication_extension' do
#  user 'root'
#  cwd "/var/www/#{node['laravel']['name']}"
#  code <<-EOH
#  yes | php artisan authentication:install
#  EOH
#end

# Run artisan migrate to setup the database and schema, then seed it
bash 'insert_db_laravel' do
  user 'root'
  cwd "/var/www/#{node['laravel']['name']}"
  code <<-EOH
  php artisan migrate
  php artisan db:seed
  EOH
end
