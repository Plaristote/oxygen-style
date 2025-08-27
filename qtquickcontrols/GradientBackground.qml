import QtQuick
import QtQuick.Shapes
import Qt5Compat.GraphicalEffects

Item {
    id: gradientBackground
    property real radius: 0
    property bool withDecoration: false
    property int yShift: 0
    required property color baseColor
    readonly property real splitY: Math.min(300.0, (3 * height) / 4)
    readonly property alias radialW: radialGradient.width

    anchors.fill: parent
    layer.enabled: radius != 0
    layer.effect: OpacityMask {
        maskSource: roundedMask
    }

    function backgroundBottomColor(color) {
        return Qt.darker(color, 1.15)
    }

    // Lower flat background section
    Rectangle {
        id: lowerSection
        anchors.fill: parent
        anchors.topMargin: Math.max(0, gradientBackground.splitY + gradientBackground.yShift)
        color: backgroundBottomColor(gradientBackground.baseColor)
        visible: anchors.topMargin < parent.height
    }
    
    // Upper linear gradient section
    Rectangle {
        id: upperSection
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: Math.max(0, gradientBackground.splitY + gradientBackground.yShift)
        visible: height > 0
        
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop { 
                position: 0.0
                color: Qt.lighter(gradientBackground.baseColor, 1.1)
            }
            GradientStop { 
                position: 0.4
                color: gradientBackground.baseColor
            }
            GradientStop { 
                position: 1.0
                color: backgroundBottomColor(gradientBackground.baseColor)
            }
        }
    }

    GradientRadialBackground {
        id: radialGradient
        visible: withDecoration
        anchors.horizontalCenter: parent.horizontalCenter
        width: Math.min(600, gradientBackground.width)
        height: 64 + yShift
        baseColor: gradientBackground.baseColor
        y: -yShift
    }

    // Mask for rounded borders support
    Shape {
        id: roundedMask
        anchors.fill: parent
        visible: false
        
        ShapePath {
            strokeWidth: 0
            fillColor: "white"
            
            startX: radius
            startY: 0
            
            // Top edge
            PathLine { x: gradientBackground.width - radius; y: 0 }
            
            // Top-right corner
            PathArc { 
                x: gradientBackground.width
                y: radius
                radiusX: radius
                radiusY: radius
            }
            
            // Right edge
            PathLine { x: gradientBackground.width; y: gradientBackground.height - radius }
            
            // Bottom-right corner
            PathArc {
                x: gradientBackground.width - radius
                y: gradientBackground.height
                radiusX: radius
                radiusY: radius
            }
            
            // Bottom edge
            PathLine { x: radius; y: gradientBackground.height }
            
            // Bottom-left corner
            PathArc {
                x: 0
                y: gradientBackground.height - radius
                radiusX: radius
                radiusY: radius
            }
            
            // Left edge
            PathLine { x: 0; y: radius }
            
            // Top-left corner
            PathArc {
                x: radius
                y: 0
                radiusX: radius
                radiusY: radius
            }
        }
    }
}
