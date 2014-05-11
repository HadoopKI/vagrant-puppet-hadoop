node default {
	include bootstrap
	include basicackages
}

stage { 'prereqs':
	before => Stage['main'],
}

class { 'bootstrap':
	stage => prereqs
}

class bootstrap {
	file { '/etc/motd':
		content => "Welcome to your Vagrant-built virtual machine!
		Managed by Puppet.\n"
	}
	yumrepo {
	'puppetlabs':
		baseurl  => 'http://yum.puppetlabs.com/el/6.4/products/x86_64/',
		gpgcheck => '0',
		descr    => 'Puppetlabs yum repo';

	'epel':
		mirrorlist     => 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=x86_64',
		baseurl        => 'absent',
		gpgcheck => '0',
		descr          => "Extra Packages for Enterprise Linux",
	
	}
	yumrepo { ['updates', 'base', 'extras']:
    	enabled  => '1',
    	priority => '99',
  	}
  	

	package { 'yum-plugin-priorities':
    	ensure => installed,
  	}

}

class basicackages {
	package { ['git','htop','tmux']:
		ensure => present,
	}

}
