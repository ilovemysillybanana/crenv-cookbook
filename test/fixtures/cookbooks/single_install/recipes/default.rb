group 'crenv' do
  gid '1234'
  action :create
end

directory '/home/crenv/' do
  recursive true
end

user 'crenv' do
  name 'crenv'
  gid '1234'
  comment 'a user for crenv'
  home '/home/crenv'
  shell '/bin/bash'
end

directory '/home/crenv/' do
  recursive true
  owner 'crenv'
  group 'crenv'
end

crenv_install 'v1.1.0' do
  crenv_users 'crenv'
  crystal_version ['0.20.0']
  action :install
end
