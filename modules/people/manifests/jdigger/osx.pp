# == Description
#
# OS X settings specific for Jim Moore (aka "jdigger").
#
class people::jdigger::osx {

  boxen::osx_defaults { 'scrollbars always on':
    domain => 'NSGlobalDomain',
    key    => 'AppleShowScrollBars',
    value  => 'Always',
    user   => $::boxen_user,
  }

  boxen::osx_defaults { 'Activity Monitor dock icon':
    domain => 'com.apple.ActivityMonitor',
    key    => 'IconType',
    value  => 4, # 4 - RAM, 5 - CPU
    user   => $::boxen_user,
  }

  include people::jdigger::osx::trackpad::threeFingerDrag

  osx::recovery_message { 'If this Mac is found, please call 234-567-9559': }

  include osx::keyboard::capslock_to_control  # disable CAPSLOCK and make it be Ctl instead
  # include osx::global::disable_autocorrect    # disables spelling autocorrection
  include osx::global::disable_key_press_and_hold         # disable press-and-hold for accented character entry
  include osx::global::disable_remote_control_ir_receiver # disable remote control infrared receiver
  include osx::global::enable_keyboard_control_access     # enables the keyboard for navigating controls in dialogs
  # include osx::global::expand_print_dialog    # expand the print dialog by default
  # include osx::global::expand_save_dialog     # expand the save dialog by default

  # include osx::dock::2d    # use the old flat dock style
  # include osx::dock::autohide    # automatically hide the dock
  # include osx::dock::clear_dock    # ensures the dock only contains apps that are running
  # include osx::dock::disable    # disable the dock by setting a long autohide-delay
  # include osx::dock::hide_indicator_lights    # remove the indicator lights below running apps
  # include osx::dock::dim_hidden_apps    # dims icons of hidden apps

  # include osx::finder::empty_trash_securely    # enable Secure Empty Trash
  # include osx::finder::show_all_on_desktop    # does all of the above
  # include osx::finder::show_hard_drives_on_desktop
  include osx::finder::enable_quicklook_text_selection
  include osx::finder::show_external_hard_drives_on_desktop
  # include osx::finder::show_hidden_files
  include osx::finder::show_mounted_servers_on_desktop
  include osx::finder::show_removable_media_on_desktop
  include osx::finder::unhide_library    # unsets the hidden flag on ~/Library

  include osx::universal_access::ctrl_mod_zoom    # enables zoom by scrolling while holding Control
  # include osx::universal_access::enable_scrollwheel_zoom    # enables zoom using the scroll wheel

  # include osx::disable_app_quarantine # disable the downloaded app quarantine
  include osx::no_network_dsstores    # disable creation of .DS_Store files on network shares
  # include osx::software_update        # download and install software updates

  host {
    # Dispatchers
    'webcms-web01-business.timewarnercable.com':
      ip => '68.168.70.16',
      host_aliases => ['webcms-web01-residential.timewarnercable.com',
                       'webcms-web01-ctmgr.timewarnercable.com'];
    'webcms-web02-business.timewarnercable.com':
      ip => '68.168.70.144',
      host_aliases => ['webcms-web02-residential.timewarnercable.com',
                       'webcms-web02-ctmgr.timewarnercable.com'];
    'webcms-web03-business.timewarnercable.com':
      ip => '68.168.71.16',
      host_aliases => ['webcms-web03-residential.timewarnercable.com',
                       'webcms-web03-ctmgr.timewarnercable.com'];
    'webcms-web04-business.timewarnercable.com':
      ip => '68.168.71.144',
      host_aliases => ['webcms-web04-residential.timewarnercable.com',
                       'webcms-web04-ctmgr.timewarnercable.com'];
    'webcms-web05-business.timewarnercable.com':
      ip => '68.168.70.77',
      host_aliases => ['webcms-web05-residential.timewarnercable.com',
                       'webcms-web05-ctmgr.timewarnercable.com'];
    'webcms-web06-business.timewarnercable.com':
      ip => '68.168.70.205',
      host_aliases => ['webcms-web06-residential.timewarnercable.com',
                       'webcms-web06-ctmgr.timewarnercable.com'];
    'webcms-web07-business.timewarnercable.com':
      ip => '68.168.71.77',
      host_aliases => ['webcms-web07-residential.timewarnercable.com',
                       'webcms-web07-ctmgr.timewarnercable.com'];
    'webcms-web08-business.timewarnercable.com':
      ip => '68.168.71.205',
      host_aliases => ['webcms-web08-residential.timewarnercable.com',
                       'webcms-web08-ctmgr.timewarnercable.com'];
    'webcms-web09-business.timewarnercable.com':
      ip => '68.168.70.31',
      host_aliases => ['webcms-web09-residential.timewarnercable.com',
                       'webcms-web09-ctmgr.timewarnercable.com'];
    'webcms-web10-business.timewarnercable.com':
      ip => '68.168.71.31',
      host_aliases => ['webcms-web10-residential.timewarnercable.com',
                       'webcms-web10-ctmgr.timewarnercable.com'];

    # publishers
    'webcms-pub01.timewarnercable.com': ip => '68.168.71.15';
    'webcms-pub02.timewarnercable.com': ip => '68.168.71.143';
    'webcms-pub03.timewarnercable.com': ip => '68.168.71.17';
    'webcms-pub04.timewarnercable.com': ip => '68.168.71.145';
    'webcms-pub05.timewarnercable.com': ip => '68.168.70.79';
    'webcms-pub06.timewarnercable.com': ip => '68.168.70.207';
    'webcms-pub07.timewarnercable.com': ip => '68.168.71.79';
    'webcms-pub08.timewarnercable.com': ip => '68.168.71.207';
    'webcms-pub09.timewarnercable.com': ip => '68.168.70.235';
    'webcms-pub10.timewarnercable.com': ip => '68.168.71.235';

    # Prod Authors
    'webcms-auth01.cdp.timewarnercable.com': ip => '68.168.70.15';
    'webcms-auth02.cdp.timewarnercable.com': ip => '68.168.70.143';

    # Beta
    'beta01.timewarnercable.com': ip => '71.74.49.57';
    'beta02.timewarnercable.com': ip => '71.74.49.58';
  }

}
