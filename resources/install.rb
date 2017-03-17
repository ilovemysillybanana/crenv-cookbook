resource_name :crenv_install
property :version, String, name_property: true
property :git_url, String, default: node['crenv']['git_url']
property :git_ref, String, default: node['crenv']['git_ref']
property :build_repo, String, default: node['crenv']['build_repo']
property :update_repo, String, default: node['crenv']['update_repo']
property :update, [String, NilClass, TrueClass, FalseClass], default: node['crenv']['upgrade']
property :crenv_users, [String, Array, Hash, NilClass], default: node['crenv']['user_installs']
property :install_path, String, default: node['crenv']['install_path']
property :crystal_version, String, default: node['crenv']['crystal-version']
property :plugins, [Hash, Hash, NilClass], default: node['crenv']['plugins']
property :user_plugin, [Hash, Array, NilClass], default: node['crenv']['user_plugins']
property :profile, [TrueClass, FalseClass, NilClass], default: node['crenv']['create_profiled']

default_action :install

action :install do

  if node['platform_family'] == 'rhel'
    include_recipe 'build-essential::default'
    include_recipe 'git::default'
  end

  git install_path+'.crenv' do
    repository git_url
    revision git_ref
    user crenv_users
    action :checkout
  end

  directory install_path+'.crenv/plugins' do
    recursive true
    owner crenv_users
  end

  git install_path+'.crenv/plugins/crystal-build' do
    repository build_repo
    user crenv_users
    action :checkout
  end

  git install_path+'.crenv/plugins/crenv-update' do
    repository update_repo
    user crenv_users
    action :checkout
  end

  ruby_block "insert lines into profile" do
    block do
      ::File.open(install_path+'.bashrc', 'a+') do |writer|
        writer.puts <<~HEREDOC
        export PATH="$HOME/.crenv/bin:$PATH"
        eval "$(crenv init -)"
        HEREDOC
      end
    end
    action :run
    notifies :run, 'bash[install crystal]', :immediately
    not_if { node['crenv']['create_profiled'] == false }
  end

  bash 'install crystal' do
    code <<~HEREDOC
    source #{install_path}.bashrc
    crenv install #{crystal_version}
    crenv global #{crystal_version}
    HEREDOC
    user crenv_users
    environment ({'HOME' => install_path, 'USER' => crenv_users })
    action :nothing
  end
end

#removes one version
action :remove do
end

#similar to rvm implode command, removes crenv completely from the vm
action :destroy do
end
