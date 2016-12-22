resource_name :crenv_install
property :version, String, name_property: true
property :git_url, String, default: node['crenv']['git_url']
property :git_ref, String, default: node['crenv']['git_ref']
property :build_repo, String, default: node['crenv']['build_repo']
property :update_repo, String, default: node['crenv']['update_repo']
property :update, [String, NilClass, TrueClass, FalseClass], default: node['crenv']['upgrade']
property :users, [String, Array, Hash, NilClass], default: node['crenv']['user_installs']
property :root_path, String, default: node['crenv']['root_path']
property :plugins, String, default: node['crenv']['plugins']
property :user_plugin, [Hash, Array, NilClass], default: node['crenv']['user_plugins']
property :profile, [TrueClass, FalseClass, NilClass], default: node['crenv']['create_profiled']


default_action :create
