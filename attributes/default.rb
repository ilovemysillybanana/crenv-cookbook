#git repository for crenv
default['crenv']['git_url'] = 'https://github.com/pine/crenv.git'
default['crenv']['git_ref'] = 'v1.1.0'

#custom repos for building and updating crystal
default['crenv']['build_repo'] = 'https://github.com/pine/crystal-build.git'
default['crenv']['update_repo'] = 'https://github.com/pine/crenv-update.git'

#upgrade crenv
default['crenv']['upgrade'] = 'none'

#user hash, for each to have a rbenv installation
default['crenv']['user_installs'] = []

#extra system wide tunables
default['crenv']['root_path'] = '.crenv' #each user gets it in a home folder, inside a folder with this name

#shards to install for versions/users
default['crenv']['shards'] = {}
default['crenv']['user_shards'] = {}

# list of crenv plugins to install
default['crenv']['plugins']      = []
default['crenv']['user_plugins'] = []

#create the user profile.d shell script
default['crenv']['create_profiled'] = true
