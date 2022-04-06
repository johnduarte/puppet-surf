#
class surf::params {
  case $::osfamily {
    'Debian': {
      $dev_packages = [
          'libx11-dev', 'libxft-dev', 'libxinerama-dev',
          # 'libwebkitgtk-dev', # for v 0.6
          'libwebkit2gtk-4.0-dev',  # for v 2.0
          'gcc', 'g++', 'make'
        ]
    }
    default: {
      $dev_packages = [ ]
    }
  }
}
