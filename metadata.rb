name 'crenv'
maintainer 'Jose M. Tobar'
maintainer_email 'ilovemysillybanana@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures crenv'
long_description 'Installs/Configures crenv'
version '1.0.0'

depends 'yum',   '~> 4.0.0'
depends 'yum-epel', '~> 1.0.0'
depends 'selinux', '~> 0.9.0'
depends 'sudo', '~> 3.0.0'
depends 'git', '~> 5.0.0'
depends 'build-essential', '~> 7.0.3'


source_url 'https://github.com/ilovemysillybanana/crenv-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/ilovemysillybanana/crenv-cookbook/issues' if respond_to?(:issues_url)
