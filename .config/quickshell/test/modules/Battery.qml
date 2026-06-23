import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

RowLayout {
    id: root
    spacing: 6

    property bool batteryPresent: false
    visible: batteryPresent

    property int percent: -1
    property string status: "Unknown"


    Text {
        text: {
            if (root.status === "Charging") return "󰂄"
            if (root.percent < 10) return "󰁺"
            if (root.percent < 20) return "󰁻"
            if (root.percent < 30) return "󰁼"
            if (root.percent < 40) return "󰁽"
            if (root.percent < 50) return "󰁾"
            if (root.percent < 60) return "󰁿"
            if (root.percent < 70) return "󰂀"
            if (root.percent < 80) return "󰂁"
            if (root.percent < 90) return "󰂂"
            if (root.percent < 100) return "󱟢"
            return "\uf240"
        }

        color: "#7aa2f7"

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        text: root.percent >= 0 ? root.percent + "%" : "—"
        color: root.percent <= 20 ? "red" : "white"

        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 16
        font.bold: true
    }

    Process {
        id: capProc
        command: ["/bin/sh", "-c", "cat /sys/class/power_supply/BAT0/capacity"]
        running: false

        stdout: SplitParser {
            onRead: data => {
                const n = parseInt(data.trim())
                if (!isNaN(n)) root.percent = n
            }
        }
    }

    Process {
        id: presentProc
        command: ["/bin/sh", "-c", "test -d /sys/class/power_supply/BAT0 && echo yes || echo no"]
        running: false

        stdout: SplitParser {
            onRead: data => {
                root.batteryPresent = data.trim() === "yes"

                if (root.batteryPresent) {
                    capProc.running = true
                    statProc.running = true
                }
            }
        }
    }

    Process {
        id: statProc
        command: ["/bin/sh", "-c", "cat /sys/class/power_supply/BAT0/status"]
        running: false

        stdout: SplitParser {
            onRead: data => root.status = data.trim()
        }
    }
    

    Timer {
        interval: 3000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            if (root.batteryPresent){
                capProc.running = true
                statProc.running = true
            } else {
                presentProc.running = true
            }
        }
    }
}
