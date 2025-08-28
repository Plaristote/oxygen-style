import QtQuick
import org.kde.desktop as Style
import org.kde.kirigami as Kirigami
import org.kde.qqc2oxygenstyle.private

Style.MenuBarItem {
  id: controlRoot

  contentItem: Label {
    text: controlRoot.Kirigami.MnemonicData.richTextLabel
    font: controlRoot.font
    color: controlRoot.menu?.opened && OxygenHelper.menuHighlightMode != "MM_DARK" ? Kirigami.Theme.highlightedTextColor : Kirigami.Theme.textColor
    elide: Text.ElideRight
    visible: controlRoot.text
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter

    Behavior on color {
        enabled: Kirigami.Units.shortDuration > 0
        NumberAnimation {
            duration: Kirigami.Units.shortDuration
        }
    }
  }

  background: MenuItemBackground {
    implicitWidth: 40
    implicitHeight: 25
    opacity: {
      if (controlRoot.down || controlRoot.menu?.opened) return 0.7;
      else if (controlRoot.highlighted) return 0.4;
      return 0;
    }
  }
}
