import QtQuick

Item {
    implicitWidth: timeText.implicitWidth
    implicitHeight: timeText.implicitHeight

    FontLoader {
        id: nerdRoboto
        source: "/home/elliot/.local/share/fonts/RobotoMono Nerd Font Complete Mono.ttf"
    }

    Text {
        id: timeText
        anchors.centerIn: parent
        text: Qt.formatDateTime(new Date(), "  h:mm AP")
        font.family: nerdRoboto.font.family
        font.pixelSize: 24
        font.weight: Font.Bold
        color: "#a9b1d6"
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timeText.text = Qt.formatDateTime(new Date(), "  h:mm AP")
    }
}
