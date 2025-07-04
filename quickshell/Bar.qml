import Quickshell
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

    mask: Region {
        item: dashboard
    }
    implicitHeight: 30

    color: Colors.background

    Rectangle {
        id: dashboard

        implicitHeight: modules.height + extraModules.height * extraModules.visible + 10
        implicitWidth: modules.width + 10
        anchors.right: parent.right

        color: Colors.background

        GridLayout {
            id: extraModules
            anchors.bottom: dashboard.bottom
        }

        RowLayout {
            id: modules

            anchors.right: parent.right
            anchors.verticalCenter: parent.top
            anchors.verticalCenterOffset: this.height / 2 + 5
            anchors.rightMargin: 5

            WrapperManager {
                Battery {}
            }
            WrapperManager {
                Clock {}
            }
            WrapperManager {
                SystemTray {}
            }
        }
    }
}
