import QtQuick
import org.kde.desktop as Style
import org.kde.kirigami as Kirigami
import org.kde.qqc2oxygenstyle.private

Style.MenuItem {
  id: controlRoot

  readonly property color highlightColor: OxygenHelper.menuHighlightMode != "MM_DARK" ? Kirigami.Theme.highlightColor : Kirigami.Theme.backgroundColor

  background: MenuItemBackground {
    opacity: (controlRoot.highlighted || controlRoot.down) ? 1 : 0
  }
}

