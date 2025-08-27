import QtQuick
import org.kde.desktop as Style

Style.Page {
  Component.onCompleted: {
    background = realBackground
  }

  Rectangle {
    id: realBackground
    color: "transparent"
  }
}
