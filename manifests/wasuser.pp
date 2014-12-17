class profile::wasuser {
  user { 'wasuser':
    ensure     => 'present',
    home       => '/home/wasuser',
    shell      => '/bin/bash',
    managehome => true,
  } 
  group { 'wasgroup':
    ensure     => 'present',
  }
}
