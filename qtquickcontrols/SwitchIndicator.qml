import QtQuick
  
Item {
  id: indicator
  property bool checked
  signal clicked()

  implicitHeight: 20
  implicitWidth: 40

  ProgressBar {
    anchors.verticalCenter: parent.verticalCenter
    width: parent.width
    height: parent.height * 1.5
    from: 0
    to: 100
    value: indicator.checked ? 100 : 0
    enabled: false

    Behavior on value {
      NumberAnimation {
        duration: 150
        easing.type: Easing.OutCubic
      }
    }
  }

  RoundButton {
    anchors { top: parent.top; bottom: parent.bottom }
    width: height
    onClicked: indicator.clicked()
    x: indicator.checked ? width: 0
    highlighted: true

    Behavior on x {
      NumberAnimation {
        duration: 150
        easing.type: Easing.OutCubic
      }
    }
  }
}
