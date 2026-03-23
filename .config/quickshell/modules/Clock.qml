import QtQuick

Item {
    implicitWidth: 120
    implicitHeight: 40

    FontLoader {
      id: dseg
      source: "/usr/share/fonts/TTF/DSEG7Modern-Bold.ttf"
    }

    Text {
        id: timeText
        anchors.centerIn: parent
        text: Qt.formatDateTime(new Date(), "hh:mm")
        font.family: dseg.font.family
        font.pixelSize: 24
        color: "#a9b1d6"
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timeText.text = Qt.formatDateTime(new Date(), "hh:mm")
    }
}
