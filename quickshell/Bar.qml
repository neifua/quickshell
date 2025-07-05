import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "modules"

PanelWindow {
    id: root
    aboveWindows: false

    anchors {
        bottom: true
        left: true
        right: true
    }

    implicitHeight: 30

    color: Colors.background

    RowLayout {
        anchors.fill: parent
        anchors.margins: 5

        Item {
            Layout.fillWidth: true
        }

        WrapperManager {
            Brightness {}
        }

        WrapperManager {
            Battery {}
        }

        WrapperManager {
            Text {
                text: Clock.time
                color: Colors.text
                font.family: "DepartureMono Nerd Font"
                font.pixelSize: 13
            }
        }

        WrapperManager {
            SystemTray {}
        }
    }
}
