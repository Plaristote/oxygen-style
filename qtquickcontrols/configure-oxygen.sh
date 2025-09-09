#!/bin/sh
widgetStyle=`kreadconfig6 --group KDE --key widgetStyle`
if [ "$widgetStyle" = "oxygen" ] || [ "$widgetStyle" = "Oxygen" ] ; then
  export QT_QUICK_CONTROLS_STYLE=org.kde.oxygen
fi
