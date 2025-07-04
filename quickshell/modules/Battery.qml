import QtQuick
import QtQuick.Controls
import "root:/utils"

Row {
    spacing: 7

    Text {
        text: (SystemInfo.battery * 100).toFixed()
        color: Colors.text
    }

    ProgressBar {
        id: progress
        value: SystemInfo.battery
        anchors.verticalCenter: parent.verticalCenter

        background: Rectangle {
            id: bar
            implicitWidth: 40
            implicitHeight: 6
            color: Colors.primary_muted
            radius: 5
        }

        contentItem: Item {
            implicitWidth: bar.width
            implicitHeight: bar.height

            Rectangle {
                width: parent.implicitWidth * progress.visualPosition
                height: parent.height
                radius: bar.radius
                color: Colors.primary
            }
        }
    }
}
