import QtQuick
import org.kde.desktop as Style
import org.kde.kirigami as Kirigami

Style.ComboBox {
  id: controlRoot
  delegate: ItemDelegate {
    required property var model
    required property int index
    id: itemDelegate
    width: ListView.view.width
    text: model[controlRoot.textRole]
    highlighted: controlRoot.highlightedIndex === index
    property bool separatorVisible: false
    Kirigami.Theme.colorSet: controlRoot.Kirigami.Theme.inherit ? controlRoot.Kirigami.Theme.colorSet : Kirigami.Theme.Button
    Kirigami.Theme.inherit: controlRoot.Kirigami.Theme.inherit
    background: Rectangle {
      visible: itemDelegate.highlighted
      color: Kirigami.Theme.highlightColor
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
}
