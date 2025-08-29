import QtQuick
import org.kde.desktop as Style

Style.Switch {
  id: control

  indicator: SwitchIndicator {
    checked: control.checked
    onClicked: control.click()
  }
}
