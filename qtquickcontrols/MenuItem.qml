import QtQuick
import QtQuick.Layouts
import org.kde.desktop as Style
import org.kde.kirigami as Kirigami
import org.kde.qqc2oxygenstyle.private

Style.MenuItem {
  id: controlRoot

  readonly property color highlightColor: OxygenHelper.menuHighlightMode != "MM_DARK" ? Kirigami.Theme.highlightColor : Kirigami.Theme.backgroundColor

  contentItem: RowLayout {
      Item {
          Layout.preferredWidth: (controlRoot.ListView.view && controlRoot.ListView.view.hasCheckables) || controlRoot.checkable ? controlRoot.indicator.width : Kirigami.Units.smallSpacing
      }
      Kirigami.Icon {
          Layout.alignment: Qt.AlignVCenter
          visible: (controlRoot.ListView.view && controlRoot.ListView.view.hasIcons)
              || (controlRoot.icon.name !== "" || controlRoot.icon.source.toString() !== "")
          source: controlRoot.icon.name !== "" ? controlRoot.icon.name : controlRoot.icon.source
          color: controlRoot.icon.color
          Layout.preferredHeight: Kirigami.Settings.hasTransientTouchInput ? Kirigami.Units.iconSizes.smallMedium : Kirigami.Units.iconSizes.small
          Layout.preferredWidth: Layout.preferredHeight
      }
      Label {
          id: label
          Layout.alignment: Qt.AlignVCenter
          Layout.fillWidth: true

          text: controlRoot.Kirigami.MnemonicData.richTextLabel
          font: controlRoot.font
          color: controlRoot.highlighted || controlRoot.down ? Kirigami.Theme.highlightedTextColor : Kirigami.Theme.textColor
          elide: Text.ElideRight
          visible: controlRoot.text
          horizontalAlignment: Text.AlignLeft
          verticalAlignment: Text.AlignVCenter

          Behavior on color {
              enabled: Kirigami.Units.shortDuration > 0
              NumberAnimation {
                  duration: Kirigami.Units.shortDuration
              }
          }
      }
      Label {
          id: shortcut
          Layout.alignment: Qt.AlignVCenter
          visible: controlRoot.action && controlRoot.action.shortcut !== undefined

          Shortcut {
              id: itemShortcut
              sequence: (shortcut.visible && controlRoot.action !== null) ? controlRoot.action.shortcut : ""
          }

          text: visible ? itemShortcut.nativeText : ""
          font: controlRoot.font
          color: label.color
          horizontalAlignment: Text.AlignRight
          verticalAlignment: Text.AlignVCenter
      }
      Item {
          Layout.preferredWidth: Kirigami.Units.smallSpacing
      }
  }


  background: MenuItemBackground {
    opacity: (controlRoot.highlighted || controlRoot.down) ? 1 : 0
  }
}

