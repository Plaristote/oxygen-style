import QtQuick
import QtQuick.Shapes
import org.kde.qqc2oxygenstyle.private

Shape {
    required property color baseColor
    readonly property color radialColor: OxygenHelper.backgroundRadialColor(baseColor)

    id: gradientRoot
    ShapePath {
        startX: 0; startY: 0
        
        PathLine { x: gradientRoot.width; y: 0 }
        PathLine { x: gradientRoot.width; y: gradientRoot.height }
        PathLine { x: 0; y: gradientRoot.height }
        PathLine { x: 0; y: 0 }

        strokeColor: "transparent"
        fillColor: "white"
        fillGradient: RadialGradient {
            centerX: gradientRoot.width / 2
            centerY: 0
            centerRadius: 64
            focalX: centerX
            focalY: centerY
            focalRadius: 0
            GradientStop {
                position: 0
                color: Qt.rgba(radialColor.r, radialColor.g, radialColor.b, 1)
            }
            GradientStop {
                position: 0.5
                color: Qt.rgba(radialColor.r, radialColor.g, radialColor.b, 0.396)
            }
            GradientStop {
                position: 0.75
                color: Qt.rgba(radialColor.r, radialColor.g, radialColor.b, 0.145)
            }
            GradientStop {
                position: 1
                color: Qt.rgba(radialColor.r, radialColor.g, radialColor.b, 0)
            }
        }
    }
}
