import QtQuick
import QtQuick.Layouts

RowLayout {
    spacing: 6
    property var now: new Date()

    Text {
        text: ""
        color: "#7aa2f7"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 16
        font.bold: true
    }

    Text {
        text: Qt.formatTime(now, "h:mm AP")
        color: "white"
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 16
        font.bold: true
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: now = new Date()
    }
}
