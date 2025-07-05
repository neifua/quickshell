import Quickshell
import Quickshell.Services.SystemTray
import QtQuick

Item {
    id: root

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    Row {
        id: layout
        spacing: 5

        Repeater {
            model: SystemTray.items

            TrayItem {
                required property SystemTrayItem modelData
                item: modelData
            }
        }
    }
}
