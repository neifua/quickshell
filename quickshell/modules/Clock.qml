pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root

    readonly property string time: {
        if (clock.date) {
            return Qt.formatDateTime(clock.date, "ddd, MMM dd yyyy - hh:mm AP");
        }
        return "";
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
