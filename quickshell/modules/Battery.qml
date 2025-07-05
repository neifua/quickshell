import Quickshell
import Quickshell.Services.UPower
import QtQuick
import QtQuick.Controls

Row {
    spacing: 7

    Text {
        text: {
            const percentage = Math.round(UPower.displayDevice.percentage * 100);
            const charging = !UPower.onBattery;

            return `BAT: ${percentage}%`;
        }
        color: Colors.text
        font.family: "DepartureMono Nerd Font"
        font.pixelSize: 13
        anchors.verticalCenter: parent.verticalCenter
    }

    ProgressBar {
        id: progress
        value: UPower.displayDevice.percentage
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
                color: {
                    const percentage = UPower.displayDevice.percentage;
                    const charging = !UPower.onBattery;

                    if (percentage < 0.2) {
                        return "#eb6f92";  // Below 20%
                    } else if (percentage < 0.4) {
                        return "#31748f";  // Below 40%
                    } else if (charging) {
                        return "#f6c177";  // Charging
                    } else {
                        return "#c4a7e7";  // Not charging
                    }
                }
            }
        }
    }
}
