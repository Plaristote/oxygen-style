import QtQuick
import org.kde.desktop as Style
import org.kde.kirigami as Kirigami

Style.ItemDelegate {
  id: controlRoot
  Kirigami.Theme.colorSet: Kirigami.Theme.Button
  background: Rectangle {
    visible: controlRoot.highlighted || controlRoot.down || controlRoot.hovered
    color: Kirigami.Theme.highlightColor
    opacity: controlRoot.highlighted || controlRoot.down ? 1 : 0.3
    radius: Kirigami.Units.cornerRadius
    border.width: 1
    border.color: Kirigami.Theme.highlightColor
    gradient: Gradient {
      orientation: Gradient.Vertical
      GradientStop {
        position: 0.0
        color: Qt.lighter(Kirigami.Theme.highlightColor, 1.35)
      }
      GradientStop {
        position: 1.0
        color: Kirigami.Theme.highlightColor
      }
    }
  }
}
