class profile::iim (
  $im_package  = "agent.installer.linux.gtk.x86_64_1.8.1000.20141126_2002.zip",
  $install_dir = '/opt/wlp',
  $temp_dir    = '/var/tmp/wlp',
  $im_user     = 'wasuser',
  $im_group    = 'wasgroup',
) {
  include allstate::wasuser
  File {
    owner => $im_user,
    group => $im_group,
  }

  file { $install_dir:
    ensure => directory,
  }
  file { $temp_dir:
    ensure => directory,
  }
  staging::deploy { $im_package:
    source => 'https://s3.amazonaws.com/saleseng/files/wlp/agent.installer.linux.gtk.x86_64_1.8.1000.20141126_2002.zip',
    target => $temp_dir,
    user   => $im_user,
    group  => $im_group,
  }
  class { '::iim':
    install_dir => $install_dir,
    temp_dir    => $temp_dir,
    im_user     => $im_user,
    im_group    => $im_group,  
    installer   => $im_package,
  }   
} 
