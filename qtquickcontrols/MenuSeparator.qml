import QtQuick
import org.kde.kirigami as Kirigami
import org.kde.desktop as Style

Style.MenuSeparator {
  SystemPalette {
    id: systemPalette
  }

  contentItem: Item {
    implicitWidth: 200
    implicitHeight: 6

    Rectangle {
      id: topBorder
      color: Kirigami.Theme.disabledTextColor
      width: parent.width * 0.60
      height: 1
      anchors {
        top: parent.top
        topMargin: 2
        horizontalCenter: parent.horizontalCenter
      }
    }

    Rectangle {
      id: bottomBorder
      color: Kirigami.Theme.highlightedTextColor
      width: parent.width * 0.60
      height: 1
      anchors {
        bottom: parent.bottom
        bottomMargin: 2
        horizontalCenter: parent.horizontalCenter
      }
    }

    // ** Gradients
    // * Left
    Rectangle {
      anchors.top: topBorder.top
      anchors.left: parent.left
      anchors.right: topBorder.left
      height: 1
      gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: Qt.rgba(topBorder.color.r, topBorder.color.g, topBorder.color.b, 0) }
        GradientStop { position: 1.0; color: topBorder.color }
      }
    }
    Rectangle {
      anchors.bottom: bottomBorder.bottom
      anchors.left: parent.left
      anchors.right: bottomBorder.left
      height: 1
      gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 0.0; color: Qt.rgba(bottomBorder.color.r, bottomBorder.color.g, bottomBorder.color.b, 0) }
        GradientStop { position: 1.0; color: bottomBorder.color }
      }
    }
    // * Right
    Rectangle {
      anchors.top: topBorder.top
      anchors.left: topBorder.right
      anchors.right: parent.right
      height: 1
      gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 1.0; color: Qt.rgba(topBorder.color.r, topBorder.color.g, topBorder.color.b, 0) }
        GradientStop { position: 0.0; color: topBorder.color }
      }
    }
    Rectangle {
      anchors.bottom: bottomBorder.bottom
      anchors.left: bottomBorder.right
      anchors.right: parent.right
      height: 1
      gradient: Gradient {
        orientation: Gradient.Horizontal
        GradientStop { position: 1.0; color: Qt.rgba(bottomBorder.color.r, bottomBorder.color.g, bottomBorder.color.b, 0) }
        GradientStop { position: 0.0; color: bottomBorder.color }
      }
    }
  }
}
