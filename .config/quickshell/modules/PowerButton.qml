import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

Item {
    width: 36
    height: 36

    property bool open: false

    Process { id: shutdown; command: ["sh", "-c", "systemctl poweroff"] }
    Process { id: reboot;   command: ["sh", "-c", "systemctl reboot"] }
    Process { id: logout;   command: ["sh", "-c", "hyprctl dispatch exit"] }

    Rectangle {
        anchors.fill: parent
        color: btn.containsMouse ? "#33ff5555" : "transparent"
        radius: 20

        Text {
            anchors.centerIn: parent
            anchors.verticalCenterOffset: -1
            text: "⏻"
            color: btn.containsMouse ? "#ff5555" : "#a9b1d6"
            font.pixelSize: 18
            font.bold: true
        }

        MouseArea {
            id: btn
            anchors.fill: parent
            hoverEnabled: true
            onClicked: open = !open
        }
    }

    PanelWindow {
        id: menu
        anchors.top: true
        anchors.right: true
        WlrLayershell.layer: WlrLayer.Overlay
        WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
        WlrLayershell.exclusiveZone: -1
        margins.top: 50
        margins.right: 8
        implicitWidth: 160
        implicitHeight: 168
        color: "transparent"
        visible: open

        HyprlandFocusGrab {
            windows: [menu]
            active: open
            onCleared: open = false
        }

        Rectangle {
            anchors.fill: parent
            color: "#1a1b26"
            radius: 24

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 4

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    color: s.containsMouse ? "#33ff5555" : "transparent"
                    radius: 8
                    Text {
                        anchors.centerIn: parent
                        text: "⏻  Shutdown"
                        color: s.containsMouse ? "#ff5555" : "#a9b1d6"
                        font.pixelSize: 13
                        font.bold: true
                    }
                    MouseArea { id: s; anchors.fill: parent; hoverEnabled: true; onClicked: shutdown.startDetached() }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    color: r.containsMouse ? "#33ffaa55" : "transparent"
                    radius: 8
                    Text {
                        anchors.centerIn: parent
                        text: "↺  Reboot"
                        color: r.containsMouse ? "#ffaa55" : "#a9b1d6"
                        font.pixelSize: 13
                        font.bold: true
                    }
                    MouseArea { id: r; anchors.fill: parent; hoverEnabled: true; onClicked: reboot.startDetached() }
                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 40
                    color: l.containsMouse ? "#3355ffaa" : "transparent"
                    radius: 8
                    Text {
                        anchors.centerIn: parent
                        text: "⎋  Logout"
                        color: l.containsMouse ? "#55ffaa" : "#a9b1d6"
                        font.pixelSize: 13
                        font.bold: true
                    }
                    MouseArea { id: l; anchors.fill: parent; hoverEnabled: true; onClicked: logout.startDetached() }
                }
            }
        }
    }
}
