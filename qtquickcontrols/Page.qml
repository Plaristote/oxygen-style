import QtQuick
import org.kde.desktop as Style

Style.Page {
  id: page

  Component.onCompleted: {
    background = realBackground
  }

  Rectangle {
    id: realBackground
    color: "transparent"
  }

  Connections {
    ignoreUnknownSignals: true
    target: page
    function onGlobalToolBarItemChanged() {
      if (page.globalToolBarItem?.background)
        page.globalToolBarItem.background.color = "transparent";
    }
  }
}
