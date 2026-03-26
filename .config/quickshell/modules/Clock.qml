import QtQuick 2.15

Item {
    implicitWidth: 120
    implicitHeight: 40

    FontLoader {
        id: nerdRoboto
        source: "/home/elliot/.local/share/fonts/RobotoMono Nerd Font Complete Mono Bold.ttf"
    }

    Text {
        id: timeText
        anchors.centerIn: parent
        text: Qt.formatDateTime(new Date(), "   h:mm AP") // 12-hour, lowercase am/pm
        font.family: nerdRoboto.font.family
        font.pixelSize: 24
        color: "#a9b1d6"
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: timeText.text = Qt.formatDateTime(new Date(), "   h:mm AP")

    }
}
