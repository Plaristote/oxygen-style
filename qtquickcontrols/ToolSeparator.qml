import QtQuick
import org.kde.kirigami as Kirigami
import org.kde.desktop as Style

Style.ToolSeparator {
  SystemPalette {
    id: systemPalette
  }

  contentItem: Item {
    implicitHeight: 30
    implicitWidth: 7

    Rectangle {
      id: leftBorder
      color: Kirigami.Theme.highlightedTextColor
      height: parent.height * 0.20
      width: 1
      anchors {
        left: parent.left
        leftMargin: 2
        verticalCenter: parent.verticalCenter
      }
    }

    Rectangle {
      id: centerLine
      color: Kirigami.Theme.disabledTextColor
      height: parent.height * 0.20
      width: 1
      anchors {
        left: leftBorder.right
        right: rightBorder.left
        verticalCenter: parent.verticalCenter
      }
    }

    Rectangle {
      id: rightBorder
      color: Kirigami.Theme.highlightedTextColor
      height: parent.height * 0.20
      width: 1
      anchors {
        right: parent.right
        rightMargin: 2
        verticalCenter: parent.verticalCenter
      }
    }

    // ** Gradients
    // * Top
    Rectangle {
      anchors.top: parent.top
      anchors.bottom: leftBorder.top
      anchors.left: leftBorder.left
      width: 1
      gradient: Gradient {
        orientation: Gradient.Vertical
        GradientStop { position: 0.0; color: Qt.rgba(leftBorder.color.r, leftBorder.color.g, leftBorder.color.b, 0) }
        GradientStop { position: 1.0; color: leftBorder.color }
      }
    }
    Rectangle {
      anchors.top: parent.top
      anchors.bottom: centerLine.top
      anchors.right: centerLine.right
      width: 1
      gradient: Gradient {
        orientation: Gradient.Vertical
        GradientStop { position: 0.0; color: Qt.rgba(centerLine.color.r, centerLine.color.g, centerLine.color.b, 0) }
        GradientStop { position: 1.0; color: centerLine.color }
      }
    }
    Rectangle {
      anchors.top: parent.top
      anchors.bottom: rightBorder.top
      anchors.right: rightBorder.right
      width: 1
      gradient: Gradient {
        orientation: Gradient.Vertical
        GradientStop { position: 0.0; color: Qt.rgba(rightBorder.color.r, rightBorder.color.g, rightBorder.color.b, 0) }
        GradientStop { position: 1.0; color: rightBorder.color }
      }
    }
    // * Bottom
    Rectangle {
      anchors.top: leftBorder.bottom
      anchors.bottom: parent.bottom
      anchors.left: leftBorder.left
      width: 1
      gradient: Gradient {
        orientation: Gradient.Vertical
        GradientStop { position: 1.0; color: Qt.rgba(leftBorder.color.r, leftBorder.color.g, leftBorder.color.b, 0) }
        GradientStop { position: 0.0; color: leftBorder.color }
      }
    }
    Rectangle {
      anchors.top: leftBorder.bottom
      anchors.bottom: parent.bottom
      anchors.left: centerLine.left
      width: 1
      gradient: Gradient {
        orientation: Gradient.Vertical
        GradientStop { position: 1.0; color: Qt.rgba(centerLine.color.r, centerLine.color.g, centerLine.color.b, 0) }
        GradientStop { position: 0.0; color: centerLine.color }
      }
    }
    Rectangle {
      anchors.top: rightBorder.bottom
      anchors.bottom: parent.bottom
      anchors.right: rightBorder.right
      width: 1
      gradient: Gradient {
        orientation: Gradient.Vertical
        GradientStop { position: 1.0; color: Qt.rgba(rightBorder.color.r, rightBorder.color.g, rightBorder.color.b, 0) }
        GradientStop { position: 0.0; color: rightBorder.color }
      }
    }
  }
}
