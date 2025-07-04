import QtQuick
import QtQuick.Layouts
import Quickshell.Services.SystemTray
import Quickshell.Wayland
import Quickshell.Widgets

Item {
    id: root

    required property var bar

    implicitHeight: 24
    implicitWidth: rowLayout.implicitWidth

    RowLayout {
        id: rowLayout

        anchors.centerIn: parent
        spacing: 15

        Repeater {
            model: SystemTray.items

            SysTrayItem {
                required property SystemTrayItem modelData

                bar: root.bar
                item: modelData
            }
        }
    }
}
