#!/bin/sh
if [ `kreadconfig6 --group KDE --key widgetStyle` = "Oxygen" ] ; then
  export QT_QUICK_CONTROLS_STYLE=org.kde.oxygen
fi
