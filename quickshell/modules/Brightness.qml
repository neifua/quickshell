import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls

Row {
    id: brightnessRow
    spacing: 7

    property real brightness: 0.5

    Text {
        text: {
            const percentage = Math.round(brightnessRow.brightness * 100);

            return `BRT: ${percentage}%`;
        }
        color: Colors.text
        font.family: "DepartureMono Nerd Font"
        font.pixelSize: 13
        anchors.verticalCenter: parent.verticalCenter
    }

    ProgressBar {
        id: progress
        value: brightnessRow.brightness
        anchors.verticalCenter: parent.verticalCenter

        background: Rectangle {
            id: bar
            implicitWidth: 40
            implicitHeight: 6
            color: Colors.primary_muted
            radius: 3
        }

        contentItem: Item {
            implicitWidth: bar.width
            implicitHeight: bar.height

            Rectangle {
                width: parent.implicitWidth * progress.visualPosition
                height: parent.height
                radius: bar.radius
                color: {
                    const level = progress.value;
                    if (level < 0.26) {
                        return "#31748f";  // Very dim
                    } else if (level < 0.51) {
                        return "#c4a7e7";  // Medium
                    } else if (level < 0.76) {
                        return "#f6c177";  // Bright
                    } else {
                        return "#ebbcba"; // Max
                    }
                }
            }
        }
    }

    Timer {
        interval: 1
        running: true
        repeat: true
        onTriggered: {
            updateProc.running = true;
        }
    }

    Process {
        id: updateProc
        command: ["brightnessctl", "get"]
        stdout: StdioCollector {
            onStreamFinished: {
                const current = parseInt(text.trim());
                if (!isNaN(current)) {
                    maxProc.running = true;
                    maxProc.currentValue = current;
                }
            }
        }
    }

    Process {
        id: maxProc
        property int currentValue: 0
        command: ["brightnessctl", "max"]
        stdout: StdioCollector {
            onStreamFinished: {
                const max = parseInt(text.trim());
                if (!isNaN(max) && max > 0) {
                    brightnessRow.brightness = maxProc.currentValue / max;
                }
            }
        }
    }

    Component.onCompleted: {
        updateProc.running = true;
    }
}
