import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import Qt5Compat.GraphicalEffects

MouseArea {
    id: root
    
    Rectangle {
        color: "red"
        anchors.fill: parent
    }

    required property var bar
    required property SystemTrayItem item
    property bool targetMenuOpen: false
    property int trayItemWidth: 16

    acceptedButtons: Qt.LeftButton | Qt.RightButton
    Layout.fillHeight: true
    implicitWidth: trayItemWidth
    onClicked: (event) => {
        switch (event.button) {
            case Qt.LeftButton:
                item.activate();
                break;
            case Qt.RightButton:
                if (item.hasMenu) menu.open();
                break;
        }
        event.accepted = true;
    }

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
        visible: false
        source: root.item.icon
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
    }

    Desaturate {
        id: desaturatedIcon
        visible: false // There's already color overlay
        anchors.fill: trayIcon
        source: trayIcon
        desaturation: 1 // 1.0 means fully grayscale
    }
    ColorOverlay {
        anchors.fill: desaturatedIcon
        source: desaturatedIcon
    }

}
