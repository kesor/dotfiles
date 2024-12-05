* [ ] create a service for `kbdd`
* [ ] background for xroot - `feh --no-fehbg --bg-fill ~/Pictures/Wallpapers/adrien-olichon-RCAhiGJsUUE-unsplash.jpg`
* [ ] service for `slstatus`
* [ ] service for `autocutsel`
* [ ] implement git config https://www.benji.dog/articles/git-config/
* [x] wrapper for eza to accept ls-like options
* [ ] custom pulumi drv that enables to disable some of the providers

* [x] qjackctl wrapper for jack : 1) install pipewire.jack 2) wrap qjackctl with LD_LIBRARY_PATH="~/.nix-profile/lib"
* [ ] pipewire + wireplumber + configuration

* [ ] Fix org.a11y.Bus : Accessibility encountered a DBus error: QDBusError("org.a11y.Bus.Error", "Failed to execute child process “/run/current-system/sw/bin/dbus-broker-launch” (No such file or directory)")

      dbind-WARNING **: 09:53:38.982: AT-SPI: Error retrieving accessibility bus address: org.a11y.Bus.Error: Failed to execute child process “/run/current-system/sw/bin/dbus-broker-launch” (No such file or directory)


* [ ] Fix file chooser portal:

      Failed to call method: org.freedesktop.DBus.Properties.Get: object_path= /org/freedesktop/portal/desktop: org.freedesktop.DBus.Error.InvalidArgs: No such interface “org.freedesktop.portal.FileChooser”

* [ ] Fix kwallet6 portal:

      Failed to call method: org.kde.KWallet.isEnabled: object_path= /modules/kwalletd6: org.freedesktop.DBus.Error.ServiceUnknown: The name org.kde.kwalletd6 was not provided by any .service files
      Failed to call method: org.kde.KWallet.close: object_path= /modules/kwalletd6: org.freedesktop.DBus.Error.ServiceUnknown: The name org.kde.kwalletd6 was not provided by any .service files

* [ ] Fix klauncher portal:

      Failed to call method: org.kde.KLauncher.start_service_by_desktop_name: object_path= /KLauncher: org.freedesktop.DBus.Error.ServiceUnknown: The name org.kde.klauncher was not provided by any .service files

* [ ] Fix secrets portal

      Failed to call method: org.freedesktop.portal.Secret.RetrieveSecret: object_path= /org/freedesktop/portal/desktop: org.freedesktop.DBus.Error.UnknownMethod: No such interface “org.freedesktop.portal.Secret” on object at path /org/freedesktop/portal/desktop

* [ ] Fix screen saver portal:

      Failed to call method: org.freedesktop.ScreenSaver.GetActive: object_path= /org/freedesktop/ScreenSaver: org.freedesktop.DBus.Error.UnknownMethod: Unknown method GetActive or interface org.freedesktop.ScreenSaver.


* [ ] Fix camera portal:

      Failed to access portal:GDBus.Error:org.freedesktop.DBus.Error.UnknownMethod: No such interface “org.freedesktop.portal.Camera” on object at path /org/freedesktop/portal/desktop
