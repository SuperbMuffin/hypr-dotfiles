import QtQuick
import Quickshell
import Quickshell.Io

Text {
    id: root
    property real tempC: 0

    // Prepend CPU icon
    text: tempC > 0 ? "\uf4bc   " + tempC + "°C" : " —"
    font.family: "RobotoMono Nerd Font"   // make sure your panel uses a Nerd Font
    color: tempC >= 85 ? "#f7768e" : tempC >= 70 ? "#a9b1d6" : "#a9b1d6"
    font.pixelSize: 20
    font.bold: true

    Process {
        id: tempProc
        command: ["/bin/sh", "/home/elliot/.config/quickshell/helpers/CpuTemp.sh"]
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
