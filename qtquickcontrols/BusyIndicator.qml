import QtQuick
import QtQuick.Templates as T
import org.kde.kirigami as Kirigami

T.BusyIndicator {
  id: busyIndicator
  implicitWidth: Kirigami.Units.gridUnit * 2
  implicitHeight: Kirigami.Units.gridUnit * 2
  contentItem: Item {
    ProgressBar {
      id: containerBar
      from: 0
      to: 1
      value: 0
      anchors.fill: parent
    }

    ProgressBar {
      id: indicatorBar
      from: 0
      to: 1
      value: 1
      height: parent.height
      width: parent.width * 0.75 * Math.min(1, parent.height / parent.width)

      SequentialAnimation on x {
        loops: Animation.Infinite
        running: busyIndicator.running

        NumberAnimation {
            from: 0
            to: containerBar.width - indicatorBar.width
            duration: 1000
            easing.type: Easing.InOutSine
        }

        NumberAnimation {
            from: containerBar.width - indicatorBar.width
            to: 0
            duration: 1000
            easing.type: Easing.InOutSine
        }
      }
    }
  }
}
