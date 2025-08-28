import QtQuick
import QtQuick.Shapes
import org.kde.qqc2oxygenstyle.private
import org.kde.kirigami as Kirigami

Item {
    id: root
    implicitHeight: 26
    implicitWidth: Kirigami.Units.gridUnit * 8

    property real borderRadius: Kirigami.Units.cornerRadius
    property color baseColor: OxygenHelper.menuHighlightColor(Qt.darker(Kirigami.Theme.backgroundColor, 1.1))
    readonly property real borderWidth: 1
    readonly property color topLeftColor: Qt.darker(baseColor, 1.15)
    readonly property color bottomRightColor: Qt.lighter(baseColor, 1.35)

    Behavior on opacity {
        enabled: Kirigami.Units.shortDuration > 0
        NumberAnimation {
            duration: Kirigami.Units.shortDuration
        }
    }

    Shape {
        anchors.fill: parent

        ShapePath {
            fillColor: root.baseColor
            strokeColor: "transparent"
            
            PathRectangle {
                x: root.borderWidth
                y: root.borderWidth
                width: root.width - 2 * root.borderWidth
                height: root.height - 2 * root.borderWidth
                radius: Math.max(0, root.borderRadius - root.borderWidth)
            }
        }
        
        // Top border
        ShapePath {
            fillColor: root.topLeftColor
            strokeColor: "transparent"
            
            PathMove {
                x: root.borderRadius
                y: 0
            }
            PathLine {
                x: root.width - root.borderRadius
                y: 0
            }
            PathArc {
                x: root.width
                y: root.borderRadius
                radiusX: root.borderRadius
                radiusY: root.borderRadius
            }
            PathLine {
                x: root.width - root.borderWidth
                y: root.borderRadius
            }
            PathArc {
                x: root.width - root.borderRadius
                y: root.borderWidth
                radiusX: Math.max(0, root.borderRadius - root.borderWidth)
                radiusY: Math.max(0, root.borderRadius - root.borderWidth)
                direction: PathArc.Counterclockwise
            }
            PathLine {
                x: root.borderRadius
                y: root.borderWidth
            }
            PathArc {
                x: root.borderWidth
                y: root.borderRadius
                radiusX: Math.max(0, root.borderRadius - root.borderWidth)
                radiusY: Math.max(0, root.borderRadius - root.borderWidth)
                direction: PathArc.Counterclockwise
            }
            PathLine {
                x: 0
                y: root.borderRadius
            }
            PathArc {
                x: root.borderRadius
                y: 0
                radiusX: root.borderRadius
                radiusY: root.borderRadius
            }
        }
        
        // Left border
        ShapePath {
            fillColor: root.topLeftColor
            strokeColor: "transparent"
            
            PathMove {
                x: 0
                y: root.borderRadius
            }
            PathLine {
                x: 0
                y: root.height - root.borderRadius
            }
            PathArc {
                x: root.borderRadius
                y: root.height
                radiusX: root.borderRadius
                radiusY: root.borderRadius
            }
            PathLine {
                x: root.borderRadius
                y: root.height - root.borderWidth
            }
            PathArc {
                x: root.borderWidth
                y: root.height - root.borderRadius
                radiusX: Math.max(0, root.borderRadius - root.borderWidth)
                radiusY: Math.max(0, root.borderRadius - root.borderWidth)
                direction: PathArc.Counterclockwise
            }
            PathLine {
                x: root.borderWidth
                y: root.borderRadius
            }
            PathArc {
                x: 0
                y: root.borderRadius
                radiusX: root.borderRadius
                radiusY: root.borderRadius
                direction: PathArc.Counterclockwise
            }
        }
        
        // Bottom border
        ShapePath {
            fillColor: root.bottomRightColor
            strokeColor: "transparent"
            
            PathMove {
                x: root.borderRadius
                y: root.height
            }
            PathLine {
                x: root.width - root.borderRadius
                y: root.height
            }
            PathArc {
                x: root.width
                y: root.height - root.borderRadius
                radiusX: root.borderRadius
                radiusY: root.borderRadius
            }
            PathLine {
                x: root.width - root.borderWidth
                y: root.height - root.borderRadius
            }
            PathArc {
                x: root.width - root.borderRadius
                y: root.height - root.borderWidth
                radiusX: Math.max(0, root.borderRadius - root.borderWidth)
                radiusY: Math.max(0, root.borderRadius - root.borderWidth)
            }
            PathLine {
                x: root.borderRadius
                y: root.height - root.borderWidth
            }
            PathArc {
                x: root.borderWidth
                y: root.height - root.borderRadius
                radiusX: Math.max(0, root.borderRadius - root.borderWidth)
                radiusY: Math.max(0, root.borderRadius - root.borderWidth)
            }
            PathLine {
                x: 0
                y: root.height - root.borderRadius
            }
            PathArc {
                x: root.borderRadius
                y: root.height
                radiusX: root.borderRadius
                radiusY: root.borderRadius
                direction: PathArc.Counterclockwise
            }
        }

        // Right border
        ShapePath {
            fillColor: root.bottomRightColor
            strokeColor: "transparent"

            PathMove {
                x: root.width
                y: root.borderRadius
            }
            PathLine {
                x: root.width
                y: root.height - root.borderRadius
            }
            PathArc {
                x: root.width - root.borderRadius
                y: root.height
                radiusX: root.borderRadius
                radiusY: root.borderRadius
                direction: PathArc.Counterclockwise
            }
            PathLine {
                x: root.width - root.borderRadius
                y: root.height - root.borderWidth
            }
            PathArc {
                x: root.width - root.borderWidth
                y: root.height - root.borderRadius
                radiusX: Math.max(0, root.borderRadius - root.borderWidth)
                radiusY: Math.max(0, root.borderRadius - root.borderWidth)
            }
            PathLine {
                x: root.width - root.borderWidth
                y: root.borderRadius
            }
            PathArc {
                x: root.width
                y: root.borderRadius
                radiusX: root.borderRadius
                radiusY: root.borderRadius
            }
        }
    }
}
