import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import QtQuick

MouseArea {
    id: root

    required property SystemTrayItem item

    acceptedButtons: Qt.LeftButton | Qt.RightButton
    implicitWidth: 14
    implicitHeight: 14

    onClicked: event => {
        if (event.button === Qt.LeftButton)
            item.activate();
        else if (event.button === Qt.RightButton) {
            console.log("Right click - has menu:", item.hasMenu);
            if (item.hasMenu)
                menu.open();
        }
    }

    QsMenuAnchor {
        id: menu
        menu: root.item.menu
        anchor.window: this.QsWindow.window
        anchor.rect.x: root.x
        anchor.rect.y: root.y - root.height  // Position above the tray item
        anchor.rect.width: root.width
        anchor.rect.height: 0
        anchor.edges: Edges.Top  // Anchor to the top edge
    }

    IconImage {
        source: {
            let icon = root.item.icon;
            if (icon.includes("?path=")) {
                const [name, path] = icon.split("?path=");
                icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
            }
            return icon;
        }
        asynchronous: true
        anchors.fill: parent
    }
}
