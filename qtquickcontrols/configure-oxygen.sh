#!/bin/sh
if [ `kreadconfig6 --group KDE --key widgetStyle` = "oxygen" ] ; then
  export QT_QUICK_CONTROLS_STYLE=org.kde.oxygen
fi
