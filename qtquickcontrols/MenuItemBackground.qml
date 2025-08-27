import QtQuick
import org.kde.kirigami as Kirigami
import org.kde.qqc2oxygenstyle.private

Rectangle {
    id: decoration
    implicitWidth: Kirigami.Units.gridUnit * 8
    radius: Kirigami.Units.cornerRadius
    color: {
        return OxygenHelper.menuHighlightMode != "MM_DARK"
            ? Kirigami.Theme.highlightColor
            : Qt.darker(Kirigami.Theme.backgroundColor, 1.1)
    }

    Behavior on opacity {
        enabled: Kirigami.Units.shortDuration > 0
        NumberAnimation {
            duration: Kirigami.Units.shortDuration
        }
    }

    // Top border
    Rectangle {
        height: 1
        color: Qt.darker(highlightColor, 1.35)
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
            leftMargin: Kirigami.Units.cornerRadius
            rightMargin: Kirigami.Units.cornerRadius
        }
    }

    // Left border
    Rectangle {
        width: 1
        color: Qt.darker(decoration.color, 1.35)
        anchors {
            top: parent.top
            left: parent.left
            bottom: parent.bottom
            topMargin: Kirigami.Units.cornerRadius
            bottomMargin: Kirigami.Units.cornerRadius
        }
    }

    // Bottom border
    Rectangle {
        height: 1
        color: Qt.lighter(decoration.color, 1.35)
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: Kirigami.Units.cornerRadius
            rightMargin: Kirigami.Units.cornerRadius
        }
    }

    // Right border
    Rectangle {
        width: 1
        color: Qt.lighter(decoration.color, 1.35)
        anchors {
            top: parent.top
            right: parent.right
            bottom: parent.bottom
            topMargin: Kirigami.Units.cornerRadius
            bottomMargin: Kirigami.Units.cornerRadius
        }
    }
}

