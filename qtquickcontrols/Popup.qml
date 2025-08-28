import QtQuick
import org.kde.desktop as Style
import org.kde.kirigami as Kirigami

Style.Popup {
  background: Kirigami.ShadowedRectangle {
    radius: Kirigami.Units.cornerRadius
    implicitWidth: Kirigami.Units.gridUnit * 8
    color: Kirigami.Theme.backgroundColor

    border.color: Kirigami.ColorUtils.linearInterpolation(Kirigami.Theme.backgroundColor, Kirigami.Theme.textColor, Kirigami.Theme.frameContrast)
    border.width: 1

    shadow.xOffset: 0
    shadow.yOffset: 2
    shadow.color: Qt.rgba(0, 0, 0, 0.3)
    shadow.size: 8

    GradientBackground {
      anchors.fill: parent
      baseColor: parent.color
      radius: Kirigami.Units.cornerRadius
    }
  }
}
