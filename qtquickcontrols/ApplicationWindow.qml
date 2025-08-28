import QtQuick
import QtQuick.Controls.impl
import QtQuick.Templates as T
import org.kde.qqc2oxygenstyle.private

T.ApplicationWindow {
    id: window

    SystemPalette {
        id: systemPalette
        colorGroup: window.active ? SystemPalette.Active : SystemPalette.Inactive
    }
    
    background: Loader {
        sourceComponent: OxygenHelper.useBackgroundGradient ? gradientBackground : plainBackground        
    }

    Component {
        id: gradientBackground
        OxygenGradientBackground {
            color: systemPalette.window
            Component.onCompleted: {
              initialize(OxygenHelper);
            }
        }
    }

    Component {
        id: plainBackground
        Rectangle {
            color: systemPalette.window
        }
    }
}
