pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property string time: Qt.formatDateTime(clock.date, "ddd, MMM d yyyy  -  hh:mm AP")
    property double battery: 1.0

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Process {
        running: true
        command: ["cat", "/sys/class/power_supply/BAT1/capacity"]
        stdout: StdioCollector {
            onStreamFinished: battery = this.text / 100.0
        }
    }
}
