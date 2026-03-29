import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

RowLayout {
    id: root
    spacing: 6
    property real tempC: 0

    Text {
        text: "\uf4bc"
        color: "#7aa2f7"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        text: root.tempC > 0 ? root.tempC + "°C" : "—"
        color: root.tempC >= 85 ? "red" : "white"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 16
        font.bold: true
    }

    Process {
        id: tempProc
        command: ["/bin/sh", "-c", "~/.config/quickshell/test/helpers/CpuTemp.sh"]
        running: false
        stdout: SplitParser {
            onRead: data => {
                const num = parseFloat(data.trim().replace(/[^\d.]/g, ""))
                if (!isNaN(num)) root.tempC = num
            }
        }
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: tempProc.running = true
    }
}
