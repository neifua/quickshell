import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects

MouseArea {
    id: root

    Rectangle {
        anchors.fill: parent
    }

    required property var bar
    required property SystemTrayItem item
    property bool targetMenuOpen: false

    acceptedButtons: Qt.LeftButton | Qt.RightButton
    implicitHeight: 12
    implicitWidth: 12

    QsMenuAnchor {
        id: menu

        menu: root.item.menu
        anchor.window: bar
        anchor.rect.x: root.x + bar.width
        anchor.rect.y: root.y
        anchor.rect.height: root.height
        anchor.edges: Edges.Bottom
    }

    IconImage {
        id: trayIcon
        source: root.item.menu
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        asynchronous: true
    }
}
