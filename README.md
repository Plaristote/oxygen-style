This is a fork of the Oxygen KDE style which was originally implemented for KDE4.

## QtQuickStyle

A QtQuickStyle has been added to support QML and Kirigami applications. It relies on
on the `org.kde.desktop` theme for most component, but also implements styles where
the default theme falls short, and uses `liboxygen` to render Oxygen's emblematic
gradient background.

_The QtQuickStyle is only available for Qt6 QML applications._

### Configuring the QtQuickControls style

As far as I know, KDE does not have a way to configure a QtQuickStyle. Instead,
you should copy `qtquickcontrols/configure-oxygen.sh` to `~/.config/plasma-workspace/env/`
and restart your Plasma session. The script will check your current configured
QtWidgets style, and if you are currently using the Oxygen QtWidget style, it will set
an environment variable to tell QML applications to use the matching QtQuickStyle.

Note that applications may chose to ignore this environment variable.

### Known issues
#### Kirigami transitions

Kirigami applications ignore the QtQuickStyle window background by default: this is
probably justified by some transition animations, which require a plain background to
look good.

I've made the choice to override the override, allowing the Oxygen gradient background
to show. However, it results in a glitchy look during some of the transitions within
Kirigami applications.

This probably could be fixed, at least with a shader, but that would require changes
in Kirigami that would render its transitions much more complex than they need to be
under normal circumstances: unless I'm missing something, I doubt that will ever happen.

## QtWidget
### Distinct color for inactive selection

The QtWidget style implements a new custom setting, to let you chose whether you want
to use a different color for inactive selections. This setting used to be implemented
in the Colors KCM, but it's no longer available.

## Desktoptheme

Adds an SVG element for the Switch inputs.
