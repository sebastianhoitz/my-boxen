class people::sebastianhoitz {
  include skype
  include dropbox
  include chrome
  include java
  include firefox
  include vagrant
  include tunnelblick
  include chicken_of_the_vnc
  include hipchat
  include vlc
  include cyberduck
  include spotify
  include virtualbox
  include macvim
  include iterm2
  include php
  include evernote
  include vim

  $home     = "/Users/${::boxen_user}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"

  file { $my:
    ensure  => directory
  }

  repository { $dotfiles:
    source  => 'sebastianhoitz/dotfiles',
    require => File[$my]
  }

  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialo
  include osx::global::disable_autocorrect
  include osx::global::tap_to_click
  include osx::dock::autohide
  include osx::dock::disable_dashboard
  include osx::finder::show_external_hard_drives_on_desktop
  include osx::finder::show_hidden_files
  #include osx::finder::show_all_filename_extensions
  include osx::no_network_dsstores
  include osx::keyboard::capslock_to_control

  include osx::global::key_repeat_delay# default 35 ms
  include osx::global::key_repeat_rate# repeat after 0 ms

  inlcude osx::global::natural_mouse_scrolling

  package { 'evernote': provider => 'brewcask' }
  package { 'skype': provider => 'brewcask' }
}
