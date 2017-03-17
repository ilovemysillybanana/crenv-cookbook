group 'crenv' do
    gid '1234'
    action :create
end

directory '/home/crenv1' do
    recursive true
end

directory 'home/crenv2' do
    recursive true
end

user 'crenv1' do
    name 'crenv1'
    gid '1234'
    comment 'a user for crenv1'
    home '/home/crenv1'
    shell '/bin/bash'
end

user 'crenv2' do
    name 'crenv2'
    gid '1234'
    comment 'a user for crenv2'
    home '/home/crenv2'
    shell '/bin/bash'
end

directory '/home/crenv1' do
    recursive true
    owner 'crenv1'
    group 'crenv1'
end

directory '/home/crenv/2' do
    recursive true
    owner 'crenv2'
    group 'crenv2'
end

%w(crenv1 crenv2).each do |_user|
    crenv_install 'v1.1.0' do
        crenv_users "#{_user}"
        crystal_version '0.20.0'
        install_path "/home/#{_user}/"
        action :install
    end
end
