# Class: surf
# ===========================
#
# Compile and install the surf browser.
#
# Parameters
# ----------
#
# * `version`
# Specifies the version of `surf` to be compiled.
# This is used by git to check out the desired
# reference prior to compilation. So, this value
# can be any valid git reference
# (e.g. tag, SHA, branch).
#
# Default: '0.6'
#
# * `prefix`
# The root location for the build artifacts to
# be installed.
#
# Default: '/usr/local'
#
# * `source_root`
# The root location for the surf git repo to
# cloned into.
#
# Default: '/opt/puppet_staging/sources'
#
# * `git_manage`
# Should the module install git for you?
#
# Default: true
#
# * `dev_packages`
# List of required packages to perform compilation.
#
# Default: $surf::params::dev_packages
#
#
# Examples
# --------
#
# @example
#    class { 'surf':
#      version => '0.4.1',
#      prefix  => '/opt/mysoftware',
#    }
#
# Authors
# -------
#
# John Duarte <john@yeliad.us>
#
# Copyright
# ---------
#
# Copyright 2015 John Duarte, unless otherwise noted.
#
class surf (
  $version = '0.6',
  $prefix = '/usr/local',
  $source_root = '/opt/puppet_staging/sources',
  $git_manage = true,
  $dev_packages = $surf::params::dev_packages,
) inherits surf::params {

  contain 'git'
  ensure_packages($dev_packages)

  # Pull down repo for surf
  vcsrepo { 'surf':
    ensure   => 'present',
    path     => "${source_root}/surf",
    provider => 'git',
    source   => 'https://git.suckless.org/surf',
    revision => $version,
    require  =>  Class['git'],
  }

  file { "${prefix}/share/surf":
    ensure => absent,
    force  => true,
    before => Exec['install surf'],
  }

  exec { 'install surf':
    cwd         => "${source_root}/surf",
    command     => '/usr/bin/make clean install',
    environment => "PREFIX=${prefix}",
    creates     => "${prefix}/bin/surf",
    subscribe   => Vcsrepo['surf'],
  }
}
